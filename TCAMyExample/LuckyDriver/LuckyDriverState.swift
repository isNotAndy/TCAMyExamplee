//
//  LuckyDriverState.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import Foundation
import TCANetworkReducers
import ComposableArchitecture

// MARK: - LuckyDriverState

public struct LuckyDriverState: Equatable {
    
    // MARK: - Properties
    
    /// Challenge id
    public let challengeID: Int?
    
    /// Parent challenge id
    public var parentChallengeID: Int?
    
    /// Lucky driver title
    public var title = L10n.LuckyDriver.title
    
    /// Lucky driver message
    public var message = L10n.LuckyDriver.message
    
    /// Image url
    public var imageURL: URL?
    
    /// User result
    public var userResult = 0.0
    
    /// Prev round result
    public var prevRoundResult: Double?
    
    /// User place
    public var userPlace: Int?
    
    /// Challenge participant count
    public var participantCount: Int?
    
    /// Challenge minimum prize place
    public var minimumPrizePlace: Int?
    
    /// Indicates is user in prize places
    public var isUserInPrize: Bool {
        if let userPlace, let minimumPrizePlace {
            return userPlace <= minimumPrizePlace
        }
        return false
    }
    
    /// Transport
    public var transport: ExplorerTransportState?
    
    /// Current lucky driver challenge
    public var challenge: ExplorerRatingRoundState?
    
    /// Indicates is remoting operation is running
    public var isRemotingOperation = false
    
    /// Indicate is start button loader actrive
    public var isStartButtonLoaderActive = false
    
    /// Indicates is user transport obtained
    public var isTransportObtained: Bool {
        transport != nil
    }
    
    // MARK: - Children
    
    /// Alert state instance
    public var alert: AlertState<LuckyDriverAction>?
    
    /// `countdownState` instance
    ///
    /// It's an instance of `countdown` submodule.
    /// We use it here to be able to integrate `countdown` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `countdown` module all changes will be saved here.
    public var countdown: TCACountdownState?
    
    /// `explorerGameState` instance
    ///
    /// It's an instance of `explorerGame` submodule.
    /// We use it here to be able to integrate `explorerGame` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `explorerGame` module all changes will be saved here.
    public var explorerGame: ExplorerGameState?
    
    // MARK: - Navigation
    
    /// Indicate is explorer game module active
    @BindingState var isExplorerGameActive = false
    
    /// Indicates is `InfoAlert` active
    @BindingState public var isInfoAlertActive = false
    
    // MARK: - Relodable
    
    /// ReloadableState instace for network operations
    public var reloadableLuckyDriver = ReloadableState<ExplorerRatingPlainObject, ExplorerServiceError>()
}

// MARK: - Initializer

extension LuckyDriverState {
    
    public init(transport: ExplorerTransportState? = nil, challengeID: Int? = nil) {
        self.transport = transport
        self.challengeID = challengeID
    }
}

// MARK: - Text

extension LuckyDriverState {
    
    public var challengeName: String {
        if let parentChallengeID {
            return L10n.Explorer.Rating.title("\(parentChallengeID)")
        }
        return L10n.Explorer.worldRound
    }
    
    public var currentPlaceText: String? {
        if let userPlace, let participantCount {
            return "#\(userPlace)/\(participantCount)"
        }
        return nil
    }
    
    public var countdownText: String {
        countdown?.coundownText ?? "00:00:00"
    }
    
    public var myDistanceText: String {
        (userResult / 1000).format(".1") + " \(L10n.kilometers)"
    }
    
    public var prevRoundResultText: String? {
        if let prevRoundResult {
            return (prevRoundResult / 1000).format(".1") + " \(L10n.kilometers)"
        } else {
            return nil
        }
    }
    
    public var targetDistanceText: String {
        if let challenge {
            return (challenge.lastPrizeResult / 1000).format(".1") + " \(L10n.kilometers)"
        }
        return "0.0 \(L10n.kilometers)"
    }
    
    public var prizeText: String? {
        if let transport {
            return String(transport.dailyProfit)
        }
        return nil
    }
}
