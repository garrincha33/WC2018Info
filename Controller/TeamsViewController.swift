//
//  TeamsViewController.swift
//  WC2018Info
//
//  Created by Richard Price on 26/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //--MARK-----arrays to hold teams from API here
    var teams:      [Teams] = []
    var teasmsCopy: [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        loadTeams()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
    
            //navbar customise here
        
    }
    
    func loadTeams() {
        //API get teams
        Api.User.getTeams { (team) in
            self.teams.append(team)
            self.teasmsCopy.append(team)
            self.collectionView.reloadData()
        }
        
    }
    
    func doSearch() {
        
        //searchbar filtering
        
    }
    
    func transition() {
        
        //transition for switching to team details VC
        
    }
    
}

extension TeamsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as! TeamCollectionViewCell
        let team = teams[indexPath.row]
        cell.teams = team
       // cell.delegate = self
        return cell
    }
}

extension TeamsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 80)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 10)
    }
    
}
