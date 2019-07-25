//
//  FNTeamsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 19/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
import URLEmbeddedView

class FNTeamsVC: UIViewController {
    // MARK: Properties and Outlets
    var teamsVM                     :   FNTeamsVM?
    @IBOutlet weak var tableView    :   UITableView!
    let constants                   :   FNConstants     =   FNConstants()
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        initViewModel()
        registerProtocols()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item      =   sender as? TeamObject else { return }
        if segue.identifier ==  constants.TEAMS_SEGUE {
            let destination =   segue.destination as? FNTeamDetailsVC
            destination?.initViewModel(team: item)
        }
    }
}

// MARK: Registration Functions Extension
extension FNTeamsVC {
    func registerProtocols() {
        tableView.delegate      =   self
        tableView.dataSource    =   self
    }
    
    func registerNibs() {
        let videoCellNib = UINib(nibName: constants.TEAM_NIB , bundle: nil)
        tableView.register(videoCellNib, forCellReuseIdentifier: constants.TEAM_IDENTIFIER)
    }
    
    func initViewModel() {
        teamsVM = FNTeamsVM()
    }
}

// MARK: Table View functions
extension FNTeamsVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let team = teamsVM?.itemAt(indexPath) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: constants.TEAM_IDENTIFIER) as? FNTeamCell else { return UITableViewCell() }
        cell.setTeam(team: team)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teamsVM?.itemAt(indexPath)
        performSegue(withIdentifier: constants.TEAMS_SEGUE, sender: team)
    }
}
