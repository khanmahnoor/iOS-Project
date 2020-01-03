//
//  GalleryService.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol GalleryService: NetworkEngine {}

extension GalleryService {
    typealias failure        =   (_ message: String) -> ()
    typealias fetchedGallery = (_ galleryObjects: [GalleryObject]?) -> ()
    
    /// Function to fetch all gallery objects
    ///
    /// - Parameter onSuccess: completion handler for the fetched objects
    func fetchGallery(onSuccess: @escaping fetchedGallery, onFailure: @escaping failure) {
        let node = "Gallery"
        let observerType = DataEventType.value
        addFirebaseObserver(node: node, observerType: observerType, onSuccess: onSuccess, onFailure: onFailure)
    }
}
