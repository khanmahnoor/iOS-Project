//
//  Constants.swift
//  Football News
//
//  Created by Mahnoor Khan on 17/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

//struct
enum FNConstants : String {
    // MARK: NIB Names
    case FACT_NIB           =   "FNFactCell"
    case NEWS_NIB           =   "FNNewsCell"
    case TEAM_NIB           =   "FNTeamCell"
    case VIDEO_NIB          =   "FNVideoCell"
    case PLAYER_NIB         =   "FNPlayerCell"
    case GALLERY_NIB        =   "FNGalleryCell"
    
    // MARK: Segue Identifiers
    case TEAMS_SEGUE        =   "teamsSegue"
    case PLAYERS_SEGUE      =   "playersSegue"
    case GALLERY_SEGUE      =   "gallerySegue"
    
    // MARK: Cell Identifiers
    case FACT_IDENTIFIER    =   "FactCellIdentifier"
    case NEWS_IDENTIFIER    =   "NewsCellIdentifier"
    case TEAM_IDENTIFIER    =   "TeamCellIdentifier"
    case VIDEO_IDENTIFIER   =   "VideoCellIdentifier"
    case PLAYER_IDENTIFIER  =   "PlayerCellIdentifier"
    case GALLERY_IDENTIFIER =   "GalleryCellIdentifier"
}
