//
//  FNTeamDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNTeamDetailsVM {
    // MARK: Properties
    var model : TeamObject?
    
    // MARK: Initializer
    init (team : TeamObject) {
        self.model = team
    }
}

// MARK: Getters
extension FNTeamDetailsVM {
    func getTeamName() -> String {
        guard let name = model?.name else { return "" }
        return name
    }
    
    func getTeamCountry() -> String {
        guard let country = model?.country else { return "" }
        return country
    }
    
    func getTeamDescription() -> String {
        guard let description = model?.description else { return "" }
        return description
    }
}

// MARK: Image Download
extension FNTeamDetailsVM : NetworkEngine {
    typealias fetchedFlag = (_ flag : UIImage?)->()
    func getTeamFlag(onSuccess : @escaping (fetchedFlag)) {
        if let url : URL = URL(string: model?.flagUrl ?? "") {
            getImage(imageUrl: url, image: onSuccess)
        }
    }
}
