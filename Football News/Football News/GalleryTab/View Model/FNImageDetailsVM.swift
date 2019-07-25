//
//  FNImageDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNImageDetailsVM {
    // MARK: Properties
    var model : GalleryObject?
    
    // MARK: Initializer
    init (galleryImage : GalleryObject) {
        self.model = galleryImage
    }
}

// MARK: Setting Image
extension FNImageDetailsVM : NetworkEngine {
    typealias fetchedImage = (_ playerImage : UIImage?)->()
    func getPlayerImage(onSuccess : @escaping (fetchedImage)) {
        if let url : URL = URL(string: model?.imageUrl ?? "") {
            getImage(imageUrl: url, image: onSuccess)
        }
    }
}
