//
//  DataManager.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNDataManager {
    // MARK: Properties
    static let shared = FNDataManager()
    static var initialObjs : UInt = 10
    
    var teamsModel          :   [TeamObject]?
    var playersModel        :   [PlayerObject]?
    var galleryModel        :   [GalleryObject]?
    var feedModel           :   [NewsFeedObject]?
    var citiesModel         :   [CityObject]?
    var feedDataFetched     :   (()->())?
    let constants           :   FNConstants         =   FNConstants()
    
    // MARK: Initializer
    private init() {
        fetchFeed()
        getCities()
        fetchTeamsData()
        fetchPlayersData()
        fetchGalleryData()
    }
}

// MARK: Fetch Feed, Players, Teams, Gallery
extension FNDataManager : NewsfeedService, PlayerService, TeamService, GalleryService, CitiesService {
    func fetchFeed() {
        fetchInitialFeed(noOfObjects: FNDataManager.initialObjs) { (objects) in
            if let fetchedObjects : [NewsFeedObject] = objects {
                self.feedModel = fetchedObjects
                self.feedDataFetched?()
            } else {
                
            }
        }
    }
    
    func fetchPlayersData() {
        fetchPlayers { (objects) in
            if let fetchedObjects : [PlayerObject] = objects {
                self.playersModel = fetchedObjects
            }
        }
    }
    
    func fetchTeamsData() {
        fetchTeams { (objects) in
            if let fetchedObjects : [TeamObject] = objects {
                self.teamsModel = fetchedObjects
            }
        }
    }
    
    func fetchGalleryData() {
        fetchGallery { (objects) in
            if let fetchedObjects : [GalleryObject] = objects {
                self.galleryModel = fetchedObjects
            }
        }
    }

    func getCities() {
        fetchCities { (objects) in
            if let fetchedObjects : [CityObject] = objects {
                self.citiesModel = fetchedObjects
            }
        }
    }
}

extension FNDataManager {
    func convertToString(number : UInt) -> String {
        if number > 0 && number < 10 {
            return "0" + String(number)
        }
        else {
            return String(number)
        }
    }
}
