//
//  FNPlayerDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 22/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNPlayerDetailsVC: UIViewController {

    var player : PlayerObject?
    @IBOutlet weak var playerName : UILabel!
    @IBOutlet weak var playerClub : UILabel!
    @IBOutlet weak var playerDescription : UILabel!
    @IBOutlet weak var playerImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayerDetails()
    }
}

extension FNPlayerDetailsVC {
    func getPlayerDetails(player : PlayerObject) {
        self.player = player
    }
    
    func setPlayerDetails() {
        playerName.text = player?.name
        playerClub.text = player?.club
        playerDescription.text = player?.description
        setImage(image : player?.imageUrl ?? "")
    }
}

extension FNPlayerDetailsVC : NetworkEngine {
    func setImage(image : String) {
        if let url : URL = URL(string: image) {
            getImage(imageUrl: url) { (UIImage) in
                self.playerImage.image = UIImage
            }
        }
    }
}
