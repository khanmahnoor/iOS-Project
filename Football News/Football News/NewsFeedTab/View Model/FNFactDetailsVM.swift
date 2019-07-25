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
    
    init(feedObject : NewsFeedObject) {
        model = feedObject
    }
}

// MARK: Functions
extension FNFactDetailsVM {
    func getFactTitle() -> String {
        return model?.title ?? ""
    }
    
    func getFactDescription() -> String {
        return model?.description ?? ""
    }
}

extension FNFactDetailsVM : NetworkEngine {
    typealias fetchedImage = (_ playerImage : UIImage?)->()
    func getFactImage(onSuccess : @escaping (fetchedImage)) {
        if let url : URL = URL(string: model?.url ?? "") {
            getImage(imageUrl: url, image: onSuccess)
        }
        else {
            guard let image = UIImage(named: "football") else { return }
            onSuccess(image)
        }
    }
}
