//
//  PlayerService.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol PlayerService: NetworkEngine {}

extension PlayerService {
    typealias failure        = (_ message: String) -> ()
    typealias fetchedPlayers = (_  playerObjects : [PlayerObject]?) -> ()
    /// Function to fetch all player objects from firebase
    ///
    /// - Parameter onSuccess: completion handler for fetched objects
    func fetchPlayers(onSuccess: @escaping fetchedPlayers, onFailure: @escaping failure) {
        let node = "Players"
        let observerType = DataEventType.value
        addFirebaseObserver(node: node, observerType: observerType, onSuccess: onSuccess, onFailure: onFailure)
    }
}
