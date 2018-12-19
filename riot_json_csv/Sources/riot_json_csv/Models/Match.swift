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
    var participants: [Participant]!
    var winner: Bool! // Which team won
    
    var teams: [Team]!
    
    init (json: JSON) {
        gameId = json["gameId"].uIntValue
        gameCreation = json["gameCreation"].uIntValue
        gameVersion = json["gameVersion"].stringValue
        mapId = json["mapId"].uIntValue
        teams = [Team]()
        participants = [Participant]()
        
        let teamsJson = json["teams"].arrayValue
        
        for teamJson in teamsJson {
            let team = Team(json: teamJson)
            teams.append(team)
        }
        
        let participantsJson = json["participants"].arrayValue
        
        for participantJson in participantsJson {
            let participant = Participant(json: participantJson)
            participants.append(participant)
        }
    }
}
