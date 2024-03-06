//
//  LuckyDriverReducer.swift
//  TheRun
//
//  Created by Gleb Kovalenko on 24.01.2024.
//  Copyright © 2024 Incetro Inc. All rights reserved.
//

import ComposableArchitecture
import TCANetworkReducers
import Combine
import CoreLayer

// MARK: - LuckyDriverReducer

public struct LuckyDriverReducer: Reducer {
    
    // MARK: - Properties
    
    /// `Explorer` service instance
    @Dependency(\.explorerService) var explorerService
    
    /// Countdown id
    private let countdownID = "lucky-driver-coundown-id"
    
    // MARK: - Feature
    
    public var body: some Reducer<LuckyDriverState, LuckyDriverAction> {
        BindingReducer()
        Scope(state: \.reloadableLuckyDriver, action: /LuckyDriverAction.reloadableLuckyDriver) {
            RelodableReducer {
                explorerService
                    .obtainRating()
                    .publish()
            }
        }
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isRemotingOperation = true
                return .send(.reloadableLuckyDriver(.load))
            case .reloadableLuckyDriver(.response(.success(let data))):
                state.parentChallengeID = data.round.id
                let rangerGameModesInfo = data.gameModesInfo.filter { $0.challenge.gameMode.type == .ranger }
                guard let luckyDriverChallenge = rangerGameModesInfo.first(where: {
                    if let challengeID = state.challengeID {
                        return $0.challenge.id == challengeID
                    } else {
                        return $0.transport.first(where: { $0.transport.type.category.transportType == .other }) != nil
                    }
                }) ?? rangerGameModesInfo.first(where: { $0.challenge.transports.contains(.other) }) else {
                    return .none
                }
                if let userTransportInfo = luckyDriverChallenge.transport.first(where: { $0.transport.type.category.transportType == .other }) {
                    state.transport = ExplorerTransportState(plain: userTransportInfo.transport)
                    state.userPlace = userTransportInfo.place
                    state.participantCount = luckyDriverChallenge.challenge.participantsCount
                    state.minimumPrizePlace = luckyDriverChallenge.challenge.lastPrizePlace
                    state.userResult = userTransportInfo.result ?? 0
                    if state.transport?.id == userTransportInfo.transport.id {
                        state.transport?.availability = .luckyDriverStarted
                    }
                }
                if state.isTransportObtained {
                    state.prevRoundResult = luckyDriverChallenge.challenge.prevLastPrizeResult
                }
                state.challenge = luckyDriverChallenge.challenge
                state.countdown = TCACountdownState(
                    id: countdownID,
                    timeInterval: Int(luckyDriverChallenge.challenge.endDate - Date().timeIntervalSince1970)
                )
                state.isRemotingOperation = false
                return .merge(
                    .concatenate(
                        .send(.countdown(.stop)),
                        .send(.countdown(.start))
                    ),
                    .send(.challengeEndDateObtained(luckyDriverChallenge.challenge.endDate))
                )
            case .reloadableLuckyDriver(.response(.failure(let error))):
                state.isRemotingOperation = false
                state.isStartButtonLoaderActive = false
                state.alert = AlertState(
                    title: L10n.Errors.error,
                    message: error.asTRError().message
                )
            case .alertDismissed:
                state.alert = nil
            case .startButtonTapped:
                guard let transport = state.transport, let challenge = state.challenge else {
                    return .none
                }
                switch transport.availability {
                case .available, .freeTransport:
                    state.explorerGame = ExplorerGameState(
                        gameMode: .luckyDriver,
                        currentResult: .init(
                            id: nil,
                            duration: 0,
                            coveredDistance: 0,
                            valuedDistance: 0,
                            lastPrizeResult: Double(challenge.lastPrizePlace),
                            challenge: challenge
                        ),
                        isChallengeActivatedLater: false,
                        transport: transport
                    )
                    state.isExplorerGameActive = true
                case .rangerStarted, .luckyDriverStarted:
                    state.isStartButtonLoaderActive = true
                    return explorerService
                        .obtainRangerInfo(transportID: transport.id)
                        .publish()
                        .map(ExplorerServiceAction.challengeResultObtained)
                        .catchToEffect(LuckyDriverAction.explorerService)
                default:
                    return .none
                }
            case .explorerGame(.close):
                state.isExplorerGameActive = false
                return .merge(
                    .send(.closeExplorerGame)
                    .deferred(
                        for: DispatchQueue.SchedulerTimeType.Stride(floatLiteral: 2),
                        scheduler: DispatchQueue.main.eraseToAnyScheduler()
                    ),
                    .send(.onAppear)
                )
            case .closeExplorerGame:
                if !state.isExplorerGameActive {
                    state.explorerGame = nil
                }
                if UserDefaults.standard.value(forKey: .isHideRatingInfoAlert) as? Bool != true {
                    state.isInfoAlertActive = true
                }
            case .onDisappear:
                return .send(.countdown(.stop))
            case .explorerService(.success(.challengeResultObtained(let currentResult))):
                guard let transport = state.transport else {
                    return .none
                }
                state.isStartButtonLoaderActive = false
                state.explorerGame = ExplorerGameState(
                    gameMode: .luckyDriver,
                    currentResult: currentResult,
                    isChallengeActivatedLater: true,
                    transport: transport
                )
                state.isExplorerGameActive = true
            default:
                break
            }
            return .none
        }
        .ifLet(\.countdown, action: /LuckyDriverAction.countdown) {
            TCACountdownFeature()
        }
        .ifLet(\.explorerGame, action: /LuckyDriverAction.explorerGame) {
            ExplorerGameFeature()
        }
    }
}
