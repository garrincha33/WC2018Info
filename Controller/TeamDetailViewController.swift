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
    
    var uid = ""
    var team: [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-----google ads DONT FORGET TO CHANGE TO LIVE ACCOUNT CURRENTLY ON TEST
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        scrollView.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 0.8)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        //self.view.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 1
        self.view.insertSubview(backgroundImage, at: 0)
        
    
        
    }



}
