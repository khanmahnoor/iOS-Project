//
//  FNTeamsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 19/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNTeamsVM {
    var model : [TeamObject]?
    
    var itemCount : Int {
        get {
            return model?.count ?? 0
        }
    }
    
    var check : Bool = false
    
    init() {
        getTeams()
    }
}

extension FNTeamsVM {
    func itemAt(_ indexPath: IndexPath) -> TeamObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[indexPath.row]
    }
}

extension FNTeamsVM : TeamService {
    func getTeams() {
        fetchTeams {(objects) in
            if let fetchedObjects : [TeamObject] = objects {
                self.model = fetchedObjects
            }
            else {
            }
        }
    }
}
