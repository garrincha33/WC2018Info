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

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamPhoto: UIImageView!
    
    var teams: Teams? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let photoUrlString = teams?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            teamPhoto.sd_setImage(with: photoUrl)
        }
        
        //--implement tap gesture to take you to detailTeamVC--
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleSelectedPhoto))
        teamPhoto.addGestureRecognizer(tap)
        teamPhoto.isUserInteractionEnabled = true

    }
    
    @objc func handleSelectedPhoto() {
        
        //use protocol
        
    }
    
    
    

}


