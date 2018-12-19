//
//  Team.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

import SwiftyJSON

class Team {
    var win: Bool!
    var teamId: UInt!
    var firstBlood: Bool!
    var firstTower: Bool!
    var firstInhibitor: Bool!
    var firstBaron: Bool!
    var firstDragon: Bool!
    var firstRiftHerald: Bool!
    var towerKills: UInt!
    var inhibitorKills: UInt!
    var baronKills: UInt!
    var dragonKills: UInt!
    var riftHeraldKills: UInt!
    
    var participants: [Participant]!
    
    init (json: JSON) {
        win = json["win"].stringValue == "Win"
        teamId = json["teamId"].uIntValue
        firstBlood = json["firstBlood"].boolValue
        firstTower = json["firstTower"].boolValue
        firstInhibitor = json["firstInhibitor"].boolValue
        firstBaron = json["firstBaron"].boolValue
        firstDragon = json["firstDragon"].boolValue
        firstRiftHerald = json["firstRiftHerald"].boolValue
        towerKills = json["towerKills"].uIntValue
        baronKills = json["baronKills"].uIntValue
        dragonKills = json["dragonKills"].uIntValue
        riftHeraldKills = json["riftHeraldKills"].uIntValue
    }
}
