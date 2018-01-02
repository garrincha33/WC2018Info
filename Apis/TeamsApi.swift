//
//  TeamsApi.swift
//  WC2018Info
//
//  Created by Richard Price on 29/10/2017.
//  Copyright © 2017 twisted echo. All rights reserved.
//

import Foundation
import FirebaseDatabase
class TeamApi {
    
    var REF_TEAMS = Database.database().reference().child("teams")
    
    //--use in TeamsVC to load team flags preparing for switch to teamsDetailsVC
    func getTeams(completion: @escaping(Teams) -> Void) {
        REF_TEAMS.observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            let arraySnap = (snapshot.children.allObjects as! [DataSnapshot]).reversed()
            arraySnap.forEach({ (child) in
                if let dict = child.value as? [String: Any] {
                    let team = Teams.init()
                    let result = team.transformTeam(dict: dict, key: child.key)
                    completion(result)
                }
            })
        }
    }
    //--use in get team detail to display team data when cell is tapped
    func observeTeams(withId id: String, completion: @escaping (Teams) -> Void) {
        REF_TEAMS.child(id).observe(.value) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let team = Teams.init()
                let result = team.transformTeam(dict: dict, key: snapshot.key)
                completion(result)
            }
        }
    }
}
