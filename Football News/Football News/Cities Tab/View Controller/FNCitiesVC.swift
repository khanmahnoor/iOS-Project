//
//  FNCitiesVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNCitiesVC: UIViewController {
    
    var citiesVM                    :   FNCitiesVM?
    @IBOutlet weak var tableView    :   UITableView!
    let constants                   :   FNConstants     =   FNConstants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
}

extension FNCitiesVC {
    func initViewModel() {
        citiesVM = FNCitiesVM()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: Table View Functions Extension
extension FNCitiesVC : UITableViewDelegate, UITableViewDataSource {
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

