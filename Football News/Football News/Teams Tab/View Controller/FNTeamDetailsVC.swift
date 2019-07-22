//
//  FNTeamDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 22/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNTeamDetailsVC: UIViewController {

    var team : TeamObject?
    @IBOutlet weak var teamName : UILabel!
    @IBOutlet weak var teamFlag : UIImageView!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var teamDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTeamDetails()
    }
}

extension FNTeamDetailsVC {
    func getTeamDetails(team : TeamObject) {
        self.team = team
    }
    
    func setTeamDetails() {
        teamName.text = team?.name
        teamCountry.text = team?.country
        teamDescription.text = team?.description
        teamFlag.layer.borderWidth = 1
        setFlag(flag: team?.flagUrl ?? "")
    }
}

extension FNTeamDetailsVC : NetworkEngine {
    func setFlag(flag : String) {
        if let url : URL = URL(string: flag) {
            getImage(imageUrl: url) { (UIImage) in
                self.teamFlag.image = UIImage
            }
        }
    }
}
