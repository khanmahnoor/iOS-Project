//
//  FNTeamDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 22/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNTeamDetailsVC: UIViewController {

    // MARK: Properties and Outlets
    var teamDetailsVM : FNTeamDetailsVM?
    @IBOutlet weak var teamName         :   UILabel!
    @IBOutlet weak var teamFlag         :   UIImageView!
    @IBOutlet weak var teamCountry      :   UILabel!
    @IBOutlet weak var teamDescription  :   UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTeamDetails()
    }
}

// MARK: View Model Init and Setting Outlets
extension FNTeamDetailsVC {
    func initViewModel(team : TeamObject) {
        self.teamDetailsVM = FNTeamDetailsVM(team : team)
    }
    
    func setTeamDetails() {
        teamName.text               =   teamDetailsVM?.getTeamName()
        teamCountry.text            =   teamDetailsVM?.getTeamCountry()
        teamDescription.text        =   teamDetailsVM?.getTeamDescription()
        teamDetailsVM?.getTeamFlag(onSuccess: { (UIImage) in
            self.teamFlag.image     =   UIImage
        })
    }
}
