//
//  DataManager.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import UIKit

class FNDataManager {
    // MARK: Properties
    var citiesModel         :   [CityObject]?
    var teamsModel          :   [TeamObject]?
    var playersModel        :   [PlayerObject]?
    var galleryModel        :   [GalleryObject]?
    var feedModel           :   [NewsFeedObject]?
    var feedDataFetched     :   (()->())?
    static var initialObjs  :   UInt                =   10
    let constants           :   FNConstants         =   FNConstants()
    static let shared                               =   FNDataManager()
    
    // MARK: Initializer
    private init() {
        fetchFeed()
        getCities()
        fetchTeamsData()
        fetchPlayersData()
        fetchGalleryData()
    }
}

extension FNDataManager: NewsfeedService, PlayerService, TeamService, GalleryService, CitiesService {
    /// Function to fetch few initial objects for Newsfeed
    func fetchFeed() {
        fetchInitialFeed(noOfObjects: FNDataManager.initialObjs, onSuccess: { objects in
            guard let fetchedObjects : [NewsFeedObject] = objects else { return }
            self.feedModel = fetchedObjects
            self.feedDataFetched?()
        }, onFailure: { message in
            print(message)
        })
    }
    
    /// Function to fetch Players Data
    func fetchPlayersData() {
        fetchPlayers(onSuccess: { objects in
            guard let fetchedObjects : [PlayerObject] = objects else { return }
            self.playersModel = fetchedObjects
        }, onFailure: { message in
            print(message)
        })
    }
    
    /// Function to fetch Teams Data
    func fetchTeamsData() {
        fetchTeams(onSuccess: { objects in
            guard let fetchedObjects : [TeamObject] = objects else { return }
            self.teamsModel = fetchedObjects
        }, onFailure: { message in
            print(message)
        })
    }
    
    /// Function to fetch Gallery Data
    func fetchGalleryData() {
        fetchGallery(onSuccess: { objects in
            guard let fetchedObjects : [GalleryObject] = objects else { return }
            self.galleryModel = fetchedObjects
        }, onFailure: { message in
            print(message)
        })
    }

    /// Function to fetch API Data
    func getCities() {
        fetchCities(onSuccess: { objects in
            guard let fetchedObjects : [CityObject] = objects else { return }
            self.citiesModel = fetchedObjects
        }, onFailure: { message in
            print(message)
        })
    }
}

extension FNDataManager {
    /// Function to convert number to String
    ///
    /// - Parameter number: number to convert
    /// - Returns: string value of number
    func convertToString(number: UInt) -> String {
        if (number > 0 && number < 10) {
            return "0" + String(number)
        } else {
            return String(number)
        }
    }
}
