//
//  FNAboutVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 29/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNAboutVC: UIViewController {
    @IBOutlet weak var about: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributedText()
    }
}

extension FNAboutVC {
    func setAttributedText() {
        let aboutString = "This is the About page of this Football Application. \nThere are 6 Tabs you can explore.\n1. Newsfeed\n2. Gallery\n3. Teams\n4. Players\n5. About\n6. Cities"
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 2, height: 2)
        myShadow.shadowColor = UIColor.lightGray
        
        let myAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 18.0), NSAttributedString.Key.shadow: myShadow]
        
        let myAttrString = NSAttributedString(string: aboutString, attributes: myAttribute as [NSAttributedString.Key : Any])
        about.attributedText = myAttrString
    }
}
