//
//  FNCityCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNCityCell: UITableViewCell {

    @IBOutlet weak var title        : UILabel!
    @IBOutlet weak var woeid        : UILabel!
    @IBOutlet weak var lattLang     : UILabel!
    @IBOutlet weak var locationType : UILabel!
}

extension FNCityCell {
    /// Function to set city in table view cell
    ///
    /// - Parameter city: city object to set
    func setCell(city: CityObject) {
        title.text          =   city.title
        woeid.text          =   String(city.woeid)
        lattLang.text       =   city.latt_long
        locationType.text   =   city.location_type
    }
}
