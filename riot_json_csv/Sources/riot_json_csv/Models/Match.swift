//
//  Match.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

class Match {
    var gameId: UInt!
    var gameCreation: UInt!
    var gameVersion: String!
    var mapId: UInt!
    var playersId: [UInt]!
    var winner: Bool! // Which team won
    
    
    init (gameId: UInt, playersId: [UInt]) {
        self.gameId = gameId
        self.playersId = playersId
    }
}
