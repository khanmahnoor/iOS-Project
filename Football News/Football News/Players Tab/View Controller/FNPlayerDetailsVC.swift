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

extension FNPlayerDetailsVC {
    /// Function to initialize view model
    ///
    /// - Parameter player: player object to initialize
    func initViewModel(player: PlayerObject) {
        self.playerDetailsVM = FNPlayerDetailsVM(player: player)
    }
    
    /// Function to set player details
    func setPlayerDetails() {
        playerName.text = playerDetailsVM?.getPlayerName()
        playerClub.text = playerDetailsVM?.getPlayerClub()
        playerDescription.text = playerDetailsVM?.getPlayerDescription()
        playerDetailsVM?.getPlayerImage(onSuccess: { image in
            self.playerImage.image = image
        }, onFailure: { message in
            print(message)
        })
    }
}

