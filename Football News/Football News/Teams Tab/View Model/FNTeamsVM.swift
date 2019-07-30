//
//  FNTeamsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 19/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNTeamsVM {
    // MARK: Properties
    var model       :   [TeamObject]?
    var itemCount   :   Int {
        get {
            return model?.count ?? 0
        }
    }
    
    // MARK: Initializer
    init() {
        self.model = FNDataManager.shared.teamsModel
    }
}

extension FNTeamsVM {
    /// Function to get team object at a specific index
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: team Object at the given index path
    func itemAt(_ indexPath: IndexPath) -> TeamObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[indexPath.row]
    }
}
