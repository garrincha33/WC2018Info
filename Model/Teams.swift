//
//  Teams.swift
//  WC2018Info
//
//  Created by Richard Price on 29/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import Foundation
struct Teams {
    
    private(set) var teamNameLowerCase:       String?
    private(set) var teamName:                String?
    private(set) var photoUrl:                String?
    private(set) var starMan:                 String?
    private(set) var starManName:             String?
    private(set) var uid:                     String?
    private(set) var id:                      String?
    private(set) var bestPerformance:         String?
    private(set) var description:             String?
    private(set) var lastAppearance:          String?
    private(set) var qualified:               String?
    private(set) var lastResults:             String?
    private(set) var teamDetails:             String?
    private(set) var latestBettingOdds:       String?
    private(set) var nextFixtures:            String?
    
}
extension Teams {
    func transformTeam(dict: [String: Any], key: String) -> Teams {
        var team = Teams()
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
        team.nextFixtures = dict["nextfixtures"] as? String
  
        return team
        
    }
}
