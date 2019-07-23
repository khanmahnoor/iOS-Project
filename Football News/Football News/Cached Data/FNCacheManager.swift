//
//  FNCache.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNCacheManager {
     // MARK: properties
    static let shared  =    FNCacheManager()
    let imageCache     =    NSCache<NSString,UIImage>()
}
