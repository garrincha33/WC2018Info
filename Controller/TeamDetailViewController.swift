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

    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-----google ads DONT FORGET TO CHANGE TO LIVE ACCOUNT CURRENTLY ON TEST
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
        
        
        
        

    }



}
