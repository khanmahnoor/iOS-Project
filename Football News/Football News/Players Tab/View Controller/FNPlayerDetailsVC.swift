//
//  FNPlayerDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 22/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNPlayerDetailsVC: UIViewController {
    // MARK: Properties and Outlets
    var playerDetailsVM                     :   FNPlayerDetailsVM?
    @IBOutlet weak var playerName           :   UILabel!
    @IBOutlet weak var playerClub           :   UILabel!
    @IBOutlet weak var playerImage          :   UIImageView!
    @IBOutlet weak var playerDescription    :   UILabel!
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayerDetails()
    }
}

// MARK: View Model Init and Setting Outlets
extension FNPlayerDetailsVC {
    func initViewModel(player : PlayerObject) {
        self.playerDetailsVM = FNPlayerDetailsVM(player: player)
    }
    
    func setPlayerDetails() {
        playerName.text = playerDetailsVM?.getPlayerName()
        playerClub.text = playerDetailsVM?.getPlayerClub()
        playerDescription.text = playerDetailsVM?.getPlayerDescription()
        playerDetailsVM?.getPlayerImage(onSuccess: { (UIImage) in
            self.playerImage.image = UIImage
        })
    }
}

