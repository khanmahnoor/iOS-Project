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

protocol GalleryService : NetworkEngine {}

extension GalleryService {
    typealias fetchedData = (_  galleryObjects : [GalleryObject]?) -> ()
    
    func fetchGallery(onSuccess : @escaping (fetchedData)) {
        let node = "Gallery"
        let observerType = DataEventType.value
        addFirebaseObserver(node: node, observerType: observerType, decodedData: onSuccess)
    }
}
