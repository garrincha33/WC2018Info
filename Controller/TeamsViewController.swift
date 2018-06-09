//
//  TeamsViewController.swift
//  WC2018Info
//
//  Created by Richard Price on 26/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    //--MARK-----arrays to hold teams from API here
    private var teams:      [Teams] = []
    private var teamsCopy:  [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //-----collection view data source and delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        //----load team data
        loadTeams()
        //----------NavBar coloring and background pic
        setupColouring()
        //----searchbar customisation
        setupSearchBar()
    }
    
    //MARK:- Helper Functions
    
    private func setupColouring() {
        self.view.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 0.2
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    private func setupSearchBar() {
        self.hideKeyboardWhenTappedAround()
        searchBar.placeholder = "search for your team"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        searchBar.tintColor = UIColor(red: 205, green: 180, blue: 106, alpha: 1)
        navigationItem.title = "Team Info"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Forum", style: .plain, target: self, action: #selector(handleForumButton))
    }
    
    @objc func handleForumButton() {
        print("testing forum button")
        
    }
    
    //MARK:-
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupnavBar()
    }
    
    private func setupnavBar() {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        //self.view.backgroundColor = UIColor(red: 13/255.0, green: 56/255.0, blue: 70/255.0, alpha: 1)
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func loadTeams() {
        //API get teams
        Api.User.getTeams { (team) in
            self.teams.append(team)
            self.teamsCopy.append(team)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
    //MARK:- Custom transition
    
    @objc private func transition() {
        let transition = CATransition()
        transition.duration = 0.7
        transition.type = kCATransitionPush
        transition.subtype = kCAGravityTop
        self.view.window?.layer.add(transition, forKey: kCATransition)
    }
    
    //MARK:-
    
    private func doSearch() {
        if let search = searchBar.text {
            teams = (search.isEmpty) ? teamsCopy : teamsCopy.filter({$0.teamName?.localizedCaseInsensitiveContains(search) == true})
        }
        
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TeamDetailVC" {
            transition()
            let detailVC = segue.destination as! TeamDetailViewController
            let uid = sender as! String
            detailVC.uid = uid
            
        }
    }
}

//MARK:- Extensions

extension TeamsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as! TeamCollectionViewCell
        let team = teams[indexPath.row]
        cell.teams = team
        cell.delegate = self
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

extension TeamsViewController: TeamCollectionViewCellDelegate {
    func goToTeamDetailsVC(teamId: String) {
        UIView.setAnimationsEnabled(false)
        performSegue(withIdentifier: "TeamDetailVC", sender: teamId)
        
    }
    
}

extension TeamsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doSearch()
        searchBar.endEditing(true)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        doSearch()
        
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
