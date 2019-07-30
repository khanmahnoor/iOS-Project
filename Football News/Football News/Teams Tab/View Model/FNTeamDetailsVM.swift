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
    init(team: TeamObject) {
        self.model = team
    }
}

extension FNTeamDetailsVM {
    /// get Team name
    ///
    /// - Returns: team name
    func getTeamName() -> String {
        guard let name = model?.name else { return "" }
        return name
    }
    
    /// get team country
    ///
    /// - Returns: team country
    func getTeamCountry() -> String {
        guard let country = model?.country else { return "" }
        return country
    }
    
    /// get team description
    ///
    /// - Returns: team description
    func getTeamDescription() -> String {
        guard let description = model?.description else { return "" }
        return description
    }
}

extension FNTeamDetailsVM : NetworkEngine {
    typealias failure = (_ message: String) -> ()
    typealias fetchedFlag = (_ flag: UIImage?) -> ()
    /// Download team flag image
    ///
    /// - Parameter onSuccess: completion handler for downloaded image
    func getTeamFlag(onSuccess: @escaping fetchedFlag, onFailure: @escaping failure) {
        guard let url : URL = URL(string: model?.flagUrl ?? "") else { return }
        getImage(imageUrl: url, onSuccess: onSuccess, onFailure: onFailure)
    }
}
