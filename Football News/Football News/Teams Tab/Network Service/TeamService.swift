//
//  TeamService.swift
//  Football News
//
//  Created by Mahnoor Khan on 19/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol TeamService: NetworkEngine {}

extension TeamService {
    typealias failure      = (_ message: String) -> ()
    typealias fetchedTeams = (_ teamObjects: [TeamObject]?) -> ()
    /// Function to fetch all team objects from firebase
    ///
    /// - Parameter onSuccess: completion handler for fetched objects
    func fetchTeams(onSuccess: @escaping fetchedTeams, onFailure: @escaping failure) {
        let node = "Teams"
        let observerType = DataEventType.value
        addFirebaseObserver(node: node, observerType: observerType, onSuccess: onSuccess, onFailure: onFailure)
    }
}
