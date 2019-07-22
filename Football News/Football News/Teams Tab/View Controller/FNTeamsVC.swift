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

    @IBOutlet weak var tableView: UITableView!
     var teamsVM : FNTeamsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProtocols()
        registerNibs()
        initViewModel()
        reloadTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? TeamObject else { return }
        if segue.identifier == FNConstants.TEAMS_SEGUE.rawValue {
            let destination = segue.destination as? FNTeamDetailsVC
            destination?.getTeamDetails(team: item)
        }
    }
}

extension FNTeamsVC {
    func registerProtocols() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerNibs() {
        let videoCellNib = UINib(nibName: FNConstants.TEAM_NIB.rawValue , bundle: nil)
        tableView.register(videoCellNib, forCellReuseIdentifier: FNConstants.TEAM_IDENTIFIER.rawValue)
    }
    
    func initViewModel() {
        teamsVM = FNTeamsVM()
    }
    
    func reloadTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.reloadData()
        }
    }
}

extension FNTeamsVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let team = teamsVM?.itemAt(indexPath) else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FNConstants.TEAM_IDENTIFIER.rawValue) as? FNTeamCell else { return UITableViewCell() }
        cell.setTeam(team: team)
        return cell
    }
}

extension FNTeamsVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let team = teamsVM?.itemAt(indexPath)
        performSegue(withIdentifier: FNConstants.TEAMS_SEGUE.rawValue, sender: team)
    }
}
