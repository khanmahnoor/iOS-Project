//
//  FNPlayersVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNPlayersVM {
    var model : [PlayerObject]?
    var itemCount : Int {
        get {
            return model?.count ?? 0
        }
    }
    init() {
        
    }
}

extension FNPlayersVM {
    func itemAt(_ indexpath: IndexPath) -> PlayerObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[indexpath.row]
    }
}

extension FNPlayersVM : PlayerService {
    func getPlayers() {
        fetchPlayers { (objects) in
            if let fetchedObjects : [PlayerObject] = objects {
                self.model = fetchedObjects
            }
        }
    }
}
