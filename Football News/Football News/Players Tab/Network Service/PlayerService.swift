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

protocol PlayerService : NetworkEngine {}

extension PlayerService {
    typealias fetchedData = (_  playerObjects : [PlayerObject]?) -> ()
    
    func fetchPlayers(onSuccess : @escaping (fetchedData)) {
        let node = "Players"
        let observerType = DataEventType.childAdded
        addFirebaseObserver(node: node, observerType: observerType, decodedData: onSuccess)
    }
}
