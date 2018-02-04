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
    
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var bannerView: GADBannerView!
    @IBOutlet weak private var teamName: UILabel!
    @IBOutlet weak private var starMan: UILabel!
    @IBOutlet weak private var starManName: UILabel!
    @IBOutlet weak private var bestPerformance: UILabel!
    @IBOutlet weak private var qualifed: UILabel!
    @IBOutlet weak private var lastResults: UILabel!
    @IBOutlet weak private var teamDetails: UILabel!
    @IBOutlet weak private var odds: UILabel!
    @IBOutlet weak private var nextFixtires: UILabel!
    
    var uid = ""
    private var team: [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //--test bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.adUnitID = "ca-app-pub-4849153814101309/7780006039"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        scrollView.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 0.8)
        loadTeams()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 1
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    private func loadTeams() {
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
