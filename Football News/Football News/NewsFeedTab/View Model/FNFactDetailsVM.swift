//
//  FNFactDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNFactDetailsVM {
    // MARK: Properties
    var model   :   NewsFeedObject?
    
    // MARK: Initializer
    init(feedObject: NewsFeedObject) {
        model = feedObject
    }
}

extension FNFactDetailsVM {
    /// Function to get Fact title
    ///
    /// - Returns: fact title
    func getFactTitle() -> String {
        return model?.title ?? ""
    }
    
    /// Function to get fact descripton
    ///
    /// - Returns: fact description
    func getFactDescription() -> String {
        return model?.description ?? ""
    }
}

extension FNFactDetailsVM : NetworkEngine {
    typealias failure = (_ message: String) -> ()
    typealias fetchedImage = (_ playerImage: UIImage?) -> ()
    /// Function to download fact image
    ///
    /// - Parameter onSuccess: completion handler for downloaded image
    func getFactImage(onSuccess: @escaping fetchedImage, onFailure: @escaping failure) {
        if let url : URL = URL(string: model?.url ?? "") {
            getImage(imageUrl: url, onSuccess: onSuccess, onFailure: onFailure)
        } else {
            guard let image = UIImage(named: "football") else { return onFailure("Image not found") }
            onSuccess(image)
        }
    }
}
