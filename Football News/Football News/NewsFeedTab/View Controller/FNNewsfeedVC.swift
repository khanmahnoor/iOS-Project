//
//  FNNewsfeedVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit


class FNNewsfeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
  var urls : [NewsFeedObject] = []
    
//    let firebaseHelper : FirebaseHelper
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let firebaseHelper : FirebaseHelper = FirebaseHelper()
        //let x : [NewsFeedObject] =
        firebaseHelper.getNewsfeedObjects { yy in
            if let x = yy {
                self.urls = x
                self.tableView.reloadData()
            }
        }
//        let objs = generateData()
//        var count = 0
//        for obj in objs {
//            firebaseHelper.addNewsfeedObject(newsfeedObject: obj, id: String(count))
//            count += 1
//        }
//        firebaseHelper.addNewsfeedObject(newsfeedObject : obj, id : "1")
        // Do any additional setup after loading the view.
    }
    
    
    func generateData() -> [NewsFeedObject] {
        return [NewsFeedObject(url: "https://youtu.be/ecHPF30cG54",
                               title: "France 2019 – Who will claim Hyundai Goal of the Tournament?",
                               description: """
Ten fabulous goals. But only one can be named the Hyundai #GoaloftheTournament.
Watch all shortlisted candidates and cast your vote here: https://www.fifa.com/womensworldcup/videos/goal-of-the-tournament/
""",
                               type: 0),
                NewsFeedObject(url: "https://youtu.be/yXwd2Ab5IVo",
                               title: "TOP 10 GOALS: FIFA Women's World Cup Canada 2015 [OFFICIAL]",
                               description: """
After a thrilling FIFA Women's World Cup, FIFA.com users picked the greatest goals scored in Canada. Do you agree with #1?
""",
                               type: 0),
                NewsFeedObject(url: "https://youtu.be/c0cUE-ePDEc",
                               title: "TOP 10 GOALS: 2014 FIFA World Cup Brazil™ [OFFICIAL]",
                               description: """
So many amazing, memorable goals! FIFA.com users chose the 10 best goals at the 2014 FIFA World Cup Brazil™. Which is your favourite?
""",
                               type: 0)]
    }
}

extension FNNewsfeedVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(urls.count)
        return urls.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url = urls[indexPath.row]
        print("URLLLLLLL",url.url)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoIdentifier") as! FNVideoCell
        cell.lala(getVideoID(url: url.url))
        return (cell)
        
    }
    
    func getVideoID (url : String) -> String {
        if let index = url.lastIndex(of: "/") {
            let range = url.index(after: index)
            let ID = String(url[range...])
            return ID
        }
        return "rdjnkb4ONWk"
    }
}
