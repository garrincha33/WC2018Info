//
//  Teams.swift
//  WC2018Info
//
//  Created by Richard Price on 29/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import Foundation
class Teams {
    
    var teamNameLowerCase:       String?
    var teamName:                String?
    var photoUrl:                String?
    var starMan:                 String?
    var starManName:             String?
    var uid:                     String?
    var id:                      String?
    var bestPerformance:         String?
    var description:             String?
    var lastAppearance:          String?
    var qualified:               String?
    var lastResults:             String?
    var teamDetails:             String?
    var latestBettingOdds:       String?
    
}
extension Teams {
    func transformTeam(dict: [String: Any], key: String) -> Teams {
        let team = Teams()
        team.id = key
        //-----------------teamdata from firebase
        team.teamNameLowerCase = dict["teamname_lowercase"] as? String
        team.teamName = dict["teamname"] as? String
        team.photoUrl = dict["photoUrl"] as? String
        team.starMan = dict["starman"] as? String
        team.starManName = dict["starmanname"] as? String
        team.uid = dict["uid"] as? String
        team.bestPerformance = dict["bestperformance"] as? String
        team.description = dict["description"] as? String
        team.lastAppearance = dict["lastappearance"] as? String
        team.qualified = dict["qualified"] as? String
        team.lastResults = dict["lastresults"] as? String
        team.teamDetails = dict["teamdetails"] as? String
        team.latestBettingOdds = dict["latestbettingodds"] as? String

        return team
        
    }
}
