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
    let constants                   :   FNConstants     =   FNConstants()
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        initViewModel()
        registerProtocols()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? PlayerObject else { return }
        if segue.identifier == constants.PLAYERS_SEGUE {
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
        let videoCellNib = UINib(nibName: constants.PLAYER_NIB , bundle: nil)
        tableView.register(videoCellNib, forCellReuseIdentifier: constants.PLAYER_IDENTIFIER)
    }
    
    func initViewModel() {
        playersVM = FNPlayersVM()
    }
}

// MARK: Table View Functions
extension FNPlayersVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let player = playersVM?.itemAt(indexPath) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: constants.PLAYER_IDENTIFIER) as? FNPlayerCell else { return UITableViewCell() }
        cell.setPlayer(player: player)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let team = playersVM?.itemAt(indexPath)
        performSegue(withIdentifier: constants.PLAYERS_SEGUE, sender: team)
    }
}
