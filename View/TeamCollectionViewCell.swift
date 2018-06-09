//
//  TeamCollectionViewCell.swift
//  WC2018Info
//
//  Created by Richard Price on 29/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import UIKit
import SDWebImage

//--MARK implement protocol for switching view
protocol TeamCollectionViewCellDelegate {
    func goToTeamDetailsVC(teamId: String)
}

class TeamCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var teamPhoto: UIImageView!
    
    var delegate: TeamCollectionViewCellDelegate?
   
    
     var teams: Teams? {
        didSet {
            
            updateView()
            
        }
    }
    
    private func updateView() {
        
            if let photoUrlString = teams?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            teamPhoto.sd_setImage(with: photoUrl)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleSelectPhoto))
        teamPhoto.addGestureRecognizer(tap)
        teamPhoto.isUserInteractionEnabled = true
    }
    
    @objc func handleSelectPhoto() {
        if let teamId = teams?.id {
            delegate?.goToTeamDetailsVC(teamId: teamId)
        }
    }
}


