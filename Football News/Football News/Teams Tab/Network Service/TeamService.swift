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

protocol TeamService : NetworkEngine {}

extension TeamService {
    typealias fetchedData = (_  teamObjects : [TeamObject]?) -> ()
    
    func fetchTeams(onSuccess : @escaping (fetchedData)) {
        let node = "Teams"
        let observerType = DataEventType.childAdded
        addFirebaseObserver(node: node, observerType: observerType, decodedData: onSuccess)
    }
}
