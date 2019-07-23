//
//  FNPlayerDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNPlayerDetailsVM {
    // MARK: Properties
    var model : PlayerObject?
    
     // MARK: Initializer
    init (player : PlayerObject) {
        self.model = player
    }
}

// MARK: Getters
extension FNPlayerDetailsVM {
    func getPlayerName() -> String {
        guard let name = model?.name else { return "" }
        return name
    }
    
    func getPlayerClub() -> String {
        guard let club = model?.club else { return "" }
        return club
    }
    
    func getPlayerDescription() -> String {
        guard let description = model?.description else { return "" }
        return description
    }
}

// MARK: Image Download
extension FNPlayerDetailsVM : NetworkEngine {
    typealias fetchedImage = (_ playerImage : UIImage)->()
    func getPlayerImage(onSuccess : @escaping (fetchedImage)) {
        if let url : URL = URL(string: model?.imageUrl ?? "") {
            getImage(imageUrl: url, image: onSuccess)
        }
    }
}
