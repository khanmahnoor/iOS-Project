//
//  FNCitiesVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNCitiesVM {
    // MARK: Properties
    var model       :   [CityObject]?
    var itemCount   :   Int {
        get {
            return model?.count ?? 0
        }
    }
    
    // MARK: Initializer
    init() {
        self.model = FNDataManager.shared.citiesModel
    }
}

extension FNCitiesVM {
    // Function to return an item at a specific indexPath
    ///
    /// - Parameter indexpath: indexPath
    /// - Returns: City object
    func itemAt(_ indexpath: IndexPath) -> CityObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[indexpath.row]
    }
}
