//
//  TeamDetailViewController.swift
//  WC2018Info
//
//  Created by Richard Price on 30/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TeamDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var starMan: UILabel!
    @IBOutlet weak var starManName: UILabel!
    @IBOutlet weak var bestPerformance: UILabel!
    @IBOutlet weak var qualifed: UILabel!
    @IBOutlet weak var lastResults: UILabel!
    @IBOutlet weak var teamDetails: UILabel!
    @IBOutlet weak var odds: UILabel!
    @IBOutlet weak var nextFixtires: UILabel!
    
    var uid = ""
    var team: [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-----google ads DONT FORGET TO CHANGE TO LIVE ACCOUNT CURRENTLY ON TEST
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
       //--live bannerView.adUnitID = "ca-app-pub-4849153814101309/2541015704"
        
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        scrollView.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 0.8)
        loadTeams()
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        //self.view.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 1
        self.view.insertSubview(backgroundImage, at: 0)
  
        
    }

        func loadTeams() {
        Api.User.observeTeams(withId: uid) { (team) in
            self.team.append(team)
            self.teamName.text = team.teamName
            self.starMan.text = team.starMan
            self.starManName.text = team.starManName
            self.bestPerformance.text = team.bestPerformance
            self.qualifed.text = team.qualified
            self.lastResults.text = team.lastResults
            self.teamDetails.text = team.teamDetails
            self.odds.text = team.latestBettingOdds
            self.nextFixtires.text = team.nextFixtures
        }
    }
}
