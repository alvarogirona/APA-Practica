
//
//  Participant.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

import SwiftyJSON

class Participant {
    var id: UInt!
    var championId: UInt!
    var stats: ParticipantStats!
    
    init (json: JSON) {
        id = json["id"].uIntValue
        championId = json["championId"].uIntValue
        let statsJson = json["stats"]
        let timeLineJson = json["timeline"]
        stats = ParticipantStats(statsJson: statsJson, timeLineJson: timeLineJson)
    }
}
