//
//  FNTeamCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 21/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNTeamCell: UITableViewCell {    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var country: UILabel!
    
}

extension FNTeamCell : NetworkEngine {
    
    func setTeam(team : TeamObject) {
        teamName.text = team.name
        country.text = team.country
        flagImage.layer.borderWidth = 1
        flagImage.layer.borderColor = UIColor.white.cgColor
        if let url : URL = URL(string: team.flagUrl) {
            getImage(imageUrl: url) { (UIImage) in
                self.flagImage.image = UIImage
            }
        }
    }
}
