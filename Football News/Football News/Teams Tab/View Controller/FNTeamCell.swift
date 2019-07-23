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

// MARK: Populating Team Cell
extension FNTeamCell : NetworkEngine {
    func setTeam(team : TeamObject) {
        country.text                    =   team.country
        teamName.text                   =   team.name
        flagImage.layer.borderWidth     =   1
        flagImage.layer.borderColor     =   UIColor.white.cgColor
        
        if let url : URL = URL(string: team.flagUrl) {
            getImage(imageUrl: url) { (UIImage) in
                self.flagImage.image    = UIImage
            }
        }
    }
}
