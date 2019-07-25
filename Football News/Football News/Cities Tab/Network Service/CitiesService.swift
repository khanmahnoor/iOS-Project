//
//  CitiesService.swift
//  Football News
//
//  Created by Mahnoor Khan on 25/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

protocol CitiesService  : NetworkEngine {}

let constants = FNConstants()
extension CitiesService {
    typealias fetchedData = (_  playerObjects : [CityObject]?) -> ()
    func fetchCities(onSuccess : @escaping (fetchedData)) {
        guard let url = constants.apiUrl else { return }
        getCities(url: url, onSuccess: onSuccess)
    }
}
