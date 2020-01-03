//
//  FNGalleryCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNGalleryCell: UICollectionViewCell {
    // MARK: Outlets
    @IBOutlet weak var containerView    :   UIView!
    @IBOutlet weak var galleryImage     :   UIImageView!
}

extension FNGalleryCell: NetworkEngine {
    /// Function to download gallery image through url and set it
    ///
    /// - Parameter galleryObject: gallery object to be set
    func setImage(galleryObject: GalleryObject) {
        guard let url : URL = URL(string: galleryObject.imageUrl) else { return }
        getImage(imageUrl: url, onSuccess: { image in
            self.galleryImage.image = image
        }, onFailure: { message in
            print(message)
        })
    }
}
