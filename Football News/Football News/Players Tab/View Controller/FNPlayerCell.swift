//
//  FNPlayerCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 19/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNPlayerCell: UITableViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerClub: UILabel!
}

extension FNPlayerCell : NetworkEngine {
    func setPlayer(player : PlayerObject) {
        playerName.text = player.name
        playerClub.text = player.club
        playerImage.layer.borderWidth = 1
        playerImage.layer.borderColor = UIColor.white.cgColor
        if let url : URL = URL(string: player.imageUrl) {
            getImage(imageUrl: url) { (UIImage) in
                self.playerImage.image = UIImage
            }
        }
    }
}
