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
    init(galleryImage: GalleryObject) {
        self.model = galleryImage
    }
}

extension FNImageDetailsVM: NetworkEngine {
    typealias failure = (_ message: String) -> ()
    typealias fetchedImage = (_ playerImage: UIImage?) -> ()
    /// Function to download gallery image
    ///
    /// - Parameter onSuccess: completion handler for downloaded image
    func getPlayerImage(onSuccess: @escaping fetchedImage, onFailure: @escaping failure) {
        guard let url : URL = URL(string: model?.imageUrl ?? "") else { return }
        getImage(imageUrl: url, onSuccess: onSuccess, onFailure: onFailure)
    }
}
