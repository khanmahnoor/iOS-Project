//
//  FNCitiesVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNCitiesVC: UIViewController {
    // MARK: Properties and Outlets
    var citiesVM                    :   FNCitiesVM?
    @IBOutlet weak var tableView    :   UITableView!
    let constants                   :   FNConstants     =   FNConstants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        registerProtocols()
    }
}

extension FNCitiesVC {
    /// Function to set delegate and data source for table view
    func registerProtocols() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /// Function to initialize view model
    func initViewModel() {
        citiesVM = FNCitiesVM()
    }
}

// MARK: Table View Functions Extension
extension FNCitiesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  =   tableView.dequeueReusableCell(withIdentifier: constants.CITY_IDENTIFIER) as? FNCityCell else { return UITableViewCell() }
        if let cityObject =  citiesVM?.itemAt(indexPath) {
            cell.setCell(city: cityObject)
        }
        return cell
    }
}

