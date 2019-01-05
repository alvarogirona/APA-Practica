//
//  Match.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

import SwiftyJSON

class Match {
    var gameId: UInt!
    var gameCreation: UInt!
    var gameVersion: String!
    var mapId: UInt!
    var winner: Bool!
    
    var teams: [Team]!
    var gameDuration: UInt
    
    init (json: JSON) {
        gameId = json["gameId"].uIntValue
        gameCreation = json["gameCreation"].uIntValue
        gameVersion = json["gameVersion"].stringValue
        mapId = json["mapId"].uIntValue
        gameDuration = json["gameDuration"].uIntValue
        teams = [Team]()
        
        let teamsJson = json["teams"].arrayValue
        
        for teamJson in teamsJson {
            let team = Team(json: teamJson)
            teams.append(team)
        }
        
        winner = teams[1].win // 0 means team 0 won, 1 means team 1 won
        
        let participantsJson = json["participants"].arrayValue
        
        for participantJson in participantsJson {
            let participant = Participant(json: participantJson)
            if participant.teamId == 100 {
                teams[0].participants.append(participant)
            } else {
                teams[1].participants.append(participant)
            }
        }
    }
}
