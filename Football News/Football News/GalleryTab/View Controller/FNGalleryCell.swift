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
    @IBOutlet weak var galleryImage: UIImageView!
}

// MARK: Image Download Function
extension FNGalleryCell : NetworkEngine {
    func setImage(galleryObject : GalleryObject) {
        if let url : URL = URL(string: galleryObject.imageUrl) {
            getImage(imageUrl: url) { (UIImage) in
                self.galleryImage.image = UIImage
            }
        }
    }
}
