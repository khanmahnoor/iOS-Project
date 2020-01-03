//
//  FNPlayerDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNPlayerDetailsVM {
    // MARK: Properties
    var model : PlayerObject?
    
     // MARK: Initializer
    init (player: PlayerObject) {
        self.model = player
    }
}

extension FNPlayerDetailsVM {
    /// Function to get player name
    ///
    /// - Returns: player name
    func getPlayerName() -> String {
        guard let name = model?.name else { return "" }
        return name
    }
    
    /// Fnction to get player club
    ///
    /// - Returns: player club
    func getPlayerClub() -> String {
        guard let club = model?.club else { return "" }
        return club
    }
    
    /// Function to get player description
    ///
    /// - Returns: player description
    func getPlayerDescription() -> String {
        guard let description = model?.description else { return "" }
        return description
    }
}

extension FNPlayerDetailsVM: NetworkEngine {
    typealias failure = (_ message: String) -> ()
    typealias fetchedImage = (_ playerImage: UIImage?) -> ()
    /// Function to download player image
    ///
    /// - Parameter onSuccess: completion handler for downloaded image
    func getPlayerImage(onSuccess: @escaping fetchedImage, onFailure: @escaping failure) {
        if let url : URL = URL(string: model?.imageUrl ?? "") {
            getImage(imageUrl: url, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
}
