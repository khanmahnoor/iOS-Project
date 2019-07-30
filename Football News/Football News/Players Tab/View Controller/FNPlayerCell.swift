//
//  FNPlayerCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 19/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNPlayerCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var playerName   :   UILabel!
    @IBOutlet weak var playerClub   :   UILabel!
    @IBOutlet weak var playerImage  :   UIImageView!
}

extension FNPlayerCell : NetworkEngine {
    /// Function to set player information in the table view cell
    ///
    /// - Parameter player: player object to set
    func setPlayer(player: PlayerObject) {
        playerImage.layer.cornerRadius  =   playerImage.frame.size.width / 2
        playerName.text                 =   player.name
        playerClub.text                 =   player.club
        if let url : URL = URL(string: player.imageUrl) {
            getImage(imageUrl: url, onSuccess: { image in
                self.playerImage.image  =   image
            }, onFailure: { message in
                print(message)
            })
        }
    }
}
