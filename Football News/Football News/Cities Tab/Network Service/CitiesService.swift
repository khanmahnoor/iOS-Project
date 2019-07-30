//
//  CitiesService.swift
//  Football News
//
//  Created by Mahnoor Khan on 25/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

protocol CitiesService: NetworkEngine {}

let constants = FNConstants()
extension CitiesService {
    typealias fetchedCities = (_  playerObjects: [CityObject]?) -> ()
    /// Function to fetch all cities object from API
    ///
    /// - Parameter onSuccess: completion handler for fetched objects
    func fetchCities(onSuccess: @escaping fetchedCities, onFailure: @escaping failure) {
        guard let url = constants.apiUrl else { return }
        getCities(url: url, onSuccess: onSuccess, onFailure: onFailure)
    }
}
