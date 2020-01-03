//
//  FNTeamCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 21/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNTeamCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var country      :   UILabel!
    @IBOutlet weak var teamName     :   UILabel!
    @IBOutlet weak var flagImage    :   UIImageView!
    
}

extension FNTeamCell : NetworkEngine {
    /// Function to load team information in table view cell
    ///
    /// - Parameter team: team object to be loaded
    func setTeam(team: TeamObject) {
        country.text                    =   team.country
        teamName.text                   =   team.name        
        guard let url : URL = URL(string: team.flagUrl) else { return }
            getImage(imageUrl: url, onSuccess: { image in
                self.flagImage.image    =   image
            }, onFailure: { message in
                print(message)
            })
    }
}
