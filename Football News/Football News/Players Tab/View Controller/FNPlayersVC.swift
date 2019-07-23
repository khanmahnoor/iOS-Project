//
//  FNPlayersVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNPlayersVC: UIViewController {

    // MARK: Properties and Outlets
    var playersVM                   :   FNPlayersVM?
    @IBOutlet weak var tableView    :   UITableView!
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProtocols()
        registerNibs()
        initViewModel()
        reloadTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? PlayerObject else { return }
        if segue.identifier == FNConstants.PLAYERS_SEGUE.rawValue {
            let destination = segue.destination as? FNPlayerDetailsVC
            destination?.initViewModel(player: item)
        }
    }
}

// MARK: Registration Functions
extension FNPlayersVC {
    func registerProtocols() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerNibs() {
        let videoCellNib = UINib(nibName: FNConstants.PLAYER_NIB.rawValue , bundle: nil)
        tableView.register(videoCellNib, forCellReuseIdentifier: FNConstants.PLAYER_IDENTIFIER.rawValue)
    }
    
    func initViewModel() {
        playersVM = FNPlayersVM()
    }
    
    func reloadTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.reloadData()
        }
    }
}

// MARK: Table View Functions
extension FNPlayersVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let player = playersVM?.itemAt(indexPath) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FNConstants.PLAYER_IDENTIFIER.rawValue) as? FNPlayerCell else { return UITableViewCell() }
        cell.setPlayer(player: player)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let team = playersVM?.itemAt(indexPath)
        performSegue(withIdentifier: FNConstants.PLAYERS_SEGUE.rawValue, sender: team)
    }
}
