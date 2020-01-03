//
//  FNAboutVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 29/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNAboutVC: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var about: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributedText()
    }
}

extension FNAboutVC {
    /// Function to set Attributed Text of a Label
    func setAttributedText() {
        let aboutString = "This is the About page of this Football Application. \n\nThere are 6 Tabs you can explore.\n\n1. Newsfeed\n\n2. Gallery\n\n3. Teams\n\n4. Players\n\n5. About\n\n6. Cities"
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 2, height: 2)
        myShadow.shadowColor = UIColor.lightGray
        
        let myAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter", size: 18.0), NSAttributedString.Key.shadow: myShadow]
        
        let myAttrString = NSAttributedString(string: aboutString, attributes: myAttribute as [NSAttributedString.Key : Any])
        about.attributedText = myAttrString
    }
}
