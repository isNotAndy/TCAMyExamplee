//
//  LuckyDriverView.swift
//  TheRun
//
//  Created by Gleb Kovalenko on 24.01.2024.
//  Copyright © 2024 Incetro Inc. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import TCANetworkReducers

// MARK: - LuckyDriverView

public struct LuckyDriverView: View {
    
    // MARK: - Properties
    
    /// The store powering the `LuckyDriver` reducer
    public let store: StoreOf<LuckyDriverReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            ReloadableView(
                store: store.scope(
                    state: \.reloadableLuckyDriver,
                    action: LuckyDriverAction.reloadableLuckyDriver
                ),
                loader: {
                    LoaderView()
                }
            ) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 32) {
                        HeaderView(
                            imageURL: viewStore.imageURL,
                            mockImageName: Asset.Explorer.LuckyDriver.luckyDriverBoss.name,
                            title: viewStore.title,
                            message: viewStore.message
                        )
                        VStack(spacing: 24) {
                            Text(L10n.LuckyDriver.challengeTaskDescription)
                                .font(.system(size: 20))
                            VStack(spacing: 16) {
                                ChallengeInfoView(
                                    title: viewStore.challengeName,
                                    subtitle: viewStore.countdownText,
                                    backgroundColor: .explorerChallengeBg,
                                    titleColor: .black,
                                    subtitleColor: .black
                                )
                                if viewStore.isTransportObtained {
                                    HStack(spacing: 8) {
                                        ChallengeInfoView(
                                            title: L10n.LuckyDriver.targetDistance,
                                            subtitle: viewStore.targetDistanceText,
                                            backgroundColor: .secondaryBgSUI2,
                                            titleColor: .fontStandard,
                                            subtitleColor: .fontStandard
                                        )
                                        ChallengeInfoView(
                                            title: L10n.LuckyDriver.myDistance,
                                            subtitle: viewStore.myDistanceText,
                                            backgroundColor: .secondaryBgSUI2,
                                            titleColor: .fontStandard,
                                            subtitleColor: viewStore.userResult >= (viewStore.challenge?.lastPrizeResult ?? 0) + 0.1 ? .hex("#2CA94C") : .gray
                                        )
                                    }
                                }
                            }
                        }
                        if let transport = viewStore.transport,
                           let prizeText = viewStore.prizeText,
                           let prevRoundResultText = viewStore.prevRoundResultText
                        {
                            VStack(spacing: 8) {
                                Text(L10n.LuckyDriver.prevResultMessage)
                                    .font(.system(size: 20))
                                Text(prevRoundResultText)
                                    .font(.system(size: 30, weight: .semibold))
                                    .padding(.bottom, 24)
                                Text(L10n.LuckyDriver.transportTitle)
                                    .font(.system(size: 22, weight: .medium))
                                    .padding(.bottom, 8)
                                ExplorerTransportView(state: transport)
                                    .overlay(alignment: .topLeading) {
                                        if let currentPlaceText = viewStore.currentPlaceText {
                                            Text(currentPlaceText)
                                                .font(.system(size: 17, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.vertical, 4)
                                                .padding(.horizontal, 8)
                                                .background(viewStore.isUserInPrize ? Color.accentColor : .hex("#959595"))
                                                .smoothCorners(radius: 30)
                                                .padding(.leading, 16)
                                                .padding(.top, 16)
                                        }
                                    }
                            }
                            VStack(spacing: 16) {
                                Text(L10n.LuckyDriver.prizeTitle)
                                    .font(.system(size: 22, weight: .medium))
                                    .multilineTextAlignment(.center)
                                HStack(spacing: 4) {
                                    Image(Asset.New.redPoints.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                    Text(prizeText)
                                        .font(.system(size: 34, weight: .bold))
                                }
                            }
                            VStack(alignment: .leading, spacing: 16) {
                                Text(L10n.LuckyDriver.failedAttemptMessage)
                                    .fontWeight(.bold)
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                                ScallingAttributedTextSUIView(
                                    text: L10n.LuckyDriver.hint.replacingIcons(
                                        offset: -4,
                                        size: 24,
                                        color: .gray
                                    ),
                                    textColor: .gray,
                                    font: .systemFont(ofSize: 17),
                                    lineLimit: 4,
                                    minHeight: 55
                                )
                            }
                            StartButton(
                                availability: transport.availability,
                                isStartButtonLoaderActive: viewStore.isStartButtonLoaderActive
                            ) {
                                viewStore.send(.startButtonTapped)
                            }
                        } else if !viewStore.isRemotingOperation {
                            Text(L10n.LuckyDriver.taskHint)
                                .font(.system(size: 20, weight: .medium))
                                .multilineTextAlignment(.center)
                            Text(L10n.LuckyDriver.failedAttemptMessage)
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .foregroundColor(.gray)
                            ScallingAttributedTextSUIView(
                                text: L10n.LuckyDriver.withoutTransportHint.replacingIcons(
                                    offset: -4,
                                    size: 24,
                                    color: .gray
                                ),
                                textColor: .gray,
                                font: .systemFont(ofSize: 17),
                                minimumScaleFactor: 1,
                                minHeight: 70
                            )
                            Button {
                                viewStore.send(.myTransportButtonTapped)
                            } label: {
                                HStack {
                                    Spacer()
                                    Text(L10n.Explorer.Main.Sections.MyTransport.title)
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .bold))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    Spacer()
                                }
                                .padding(.vertical, 15)
                                .background(Color.accentColor)
                                .smoothCorners(radius: 16)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .onDisappear {
                viewStore.send(.onDisappear)
            }
            .alert(store.scope(state: \.alert), dismiss: .alertDismissed)
            .ratingInfoAlertView(isActive: viewStore.$isInfoAlertActive)
            .fullScreenCover(isPresented: viewStore.$isExplorerGameActive) {
                IfLetStore(
                    store.scope(
                        state: \.explorerGame,
                        action: LuckyDriverAction.explorerGame
                    ),
                    then: ExplorerGameView.init
                )
            }
        }
    }
    
    // MARK: - RentButton
    
    private struct StartButton: View {
        
        // MARK: - Properties
        
        /// Transport availability type
        let availability: ExplorerUserTransportAvailabilityType
        
        /// Indicates is start button loader active
        let isStartButtonLoaderActive: Bool
        
        /// Tapped action
        let action: VoidClosure
        
        // MARK: - View
        
        var body: some View {
            Button {
                action()
            } label: {
                HStack {
                    Spacer()
                    if isStartButtonLoaderActive {
                        ProgressView()
                    } else {
                        VStack(spacing: 1) {
                            Text(availability.title)
                                .foregroundColor(availability.buttonTextColor)
                                .font(.system(size: 17, weight: .bold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    Spacer()
                }
                .overlay(alignment: .trailing) {
                    if !isStartButtonLoaderActive && availability.isDisplayPausePlay {
                        Image(systemName: "playpause")
                            .foregroundColor(availability.buttonTextColor)
                            .font(.system(size: 17, weight: .bold))
                            .padding(.trailing, 24)
                    }
                }
                .padding(.vertical, 15)
                .background(availability.buttonColor)
                .smoothCorners(radius: 16)
                .animation(.easeIn(duration: 0.2), value: isStartButtonLoaderActive)
            }
            .disabled(availability.isButtonDisabled)
            .animation(.easeInOut, value: availability)
        }
    }
    
    // MARK: - HeaderView
    
    private struct HeaderView: View, Equatable {
        
        // MARK: - Properties
        
        /// Image url
        public var imageURL: URL?
        
        /// Mock image name
        public var mockImageName: String
        
        /// Header title
        public var title: String
        
        /// Header message
        public var message: String
        
        // MARK: - View
        
        var body: some View {
            VStack(spacing: 16) {
                Image(mockImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth - 32)
                    .smoothCorners(radius: 24)
                HStack(spacing: 10) {
                    Text(title)
                        .font(.system(size: 32, weight: .medium))
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .font(.system(size: 24, weight: .medium))
                        .overlay(alignment: .topTrailing) {
                            Circle()
                                .fill(Color.accentColor)
                                .frame(width: 8, height: 8)
                                .padding(.trailing, -2)
                        }
                }
                .pin(.left)
                Text(message)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(24)
                    .pin(.left)
                    .background {
                        Color.hex("#4D8CEC")
                            .clipShape(MessageShape(cornerRadius: 24))
                            .padding(.leading, -8)
                    }
            }
        }
        
        // MARK: - Equatable
        
        static func == (lhs: LuckyDriverView.HeaderView, rhs: LuckyDriverView.HeaderView) -> Bool {
            true
        }
    }
    
    // MARK: - ChallengeInfoView
    
    private struct ChallengeInfoView: View, Equatable {
        
        // MARK: - Properties
        
        /// Info title
        let title: String
        
        /// Info subtitle
        let subtitle: String
        
        /// Background color
        let backgroundColor: Color
        
        /// Title color
        let titleColor: Color
        
        /// Subtitle color
        let subtitleColor: Color
        
        // MARK: - View
        
        var body: some View {
            VStack(spacing: 8) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(titleColor)
                Text(subtitle)
                    .font(.system(size: 30, weight: .bold).monospacedDigit())
                    .foregroundColor(subtitleColor)
            }
            .lineLimit(1)
            .minimumScaleFactor(0.38)
            .centered()
            .padding(.vertical, 16)
            .background(backgroundColor)
            .smoothCorners(radius: 24)
        }
        
        // MARK: - Equatable
        
        static func == (lhs: ChallengeInfoView, rhs: ChallengeInfoView) -> Bool {
            lhs.subtitle == rhs.subtitle
        }
    }
}
