//
//  ParticipantStats.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

import SwiftyJSON

enum Lane: String {
    case top = "TOP"
    case jungle = "JUNGLE"
    case mid = "MID"
    case support = "DUO_SUPPORT"
    case bottom = "DUO_CARRY"
}

class ParticipantStats {
    var win: Bool!
//    var itemsId: [UInt]!
    
    var kills: UInt!
    var deaths: UInt!
    var assists: UInt!
    
    var largestKillingSpree: UInt!
    var largestMultiKill: UInt!
    var killingSprees: UInt!
    
    var longestTimeSpentLiving: UInt!
    
    var doubleKills: UInt!
    var tripleKills: UInt!
    var quadraKills: UInt!
    var pentaKills: UInt!
    
    var totalDamageDealt: UInt!
    var magicDamageDealt: UInt!
    var physicalDamageDealt: UInt!
    var trueDamageDealt: UInt!
    
    var largestCriticalStrike: UInt!
    
    var totalDamageDealtToChampions: UInt!
    
    var totalHeal: UInt!
    var totalUnitsHealed: UInt!
    
    var damageSelfMitigated: UInt!
    
    var damageDealtToObjectives: UInt!
    var damageDealtToTurrets: UInt!
    
    var timeCCingOthers: UInt!
    
    var totalDamageTaken: UInt!
    var magicalDamageTaken: UInt!
    var physicalDamageTaken: UInt!
    var trueDamageTaken: UInt!
    
    var goldEarned: UInt!
    var goldSpent: UInt!
    
    var turretKills: UInt!
    var inhibitorKills: UInt!
    
    var totalMinionsKilled: UInt!
    var neutralMinionsKilled: UInt!
    var neutralMinionsKilledTeamJungle: UInt!
    var neutralMinionsKilledEnemyJungle: UInt!
    var totalTimeCrowdControlDealt: UInt!
    
    var champLevel: UInt!
    
    var wardsPlaced: UInt!
    var wardsKilled: UInt!
    
    var firstBloodKill: Bool!
    var firstBloodAssist: Bool!
    
    var firstTowerKill: Bool!
    var firstTowerAssist: Bool!
    var firstInhibitorKill: Bool!
    var firstInhibitorAssist: Bool!
    
    var creepsPerMinDeltas: Deltas! // Creep score difference versus the calculated lane opponent(s) for a specified period.
    var xpPerMinDeltas: Deltas! // Experience change for a specified period.
    var goldPerMinDeltas: Deltas! // Gold for a specified period.
    var csDiffPerMinDeltas: Deltas!
    var xpDiffPerMinDeltas: Deltas! // Experience difference versus the calculated lane opponent(s) for a specified period.
    var damageTakenPerMinDeltas: Deltas!
    var damageTakenDiffPerMinDeltas: Deltas!
    
    var lane: Lane!
    
    init (statsJson: JSON, timeLineJson: JSON) {
        win = statsJson["win"].boolValue
        
        kills = statsJson["kills"].uIntValue
        deaths = statsJson["deaths"].uIntValue
        assists = statsJson["assists"].uIntValue
        
        largestKillingSpree = statsJson["largestKillingSpree"].uIntValue
        largestMultiKill = statsJson["largestMultiKill"].uIntValue
        killingSprees = statsJson["killingSprees"].uIntValue
        
        longestTimeSpentLiving = statsJson["longestTimeSpentLiving"].uIntValue
        
        doubleKills = statsJson["doubleKills"].uIntValue
        tripleKills = statsJson["tripleKills"].uIntValue
        quadraKills = statsJson["quadraKills"].uIntValue
        pentaKills = statsJson["pentaKills"].uIntValue
        
        totalDamageDealt = statsJson["totalDamageDealt"].uIntValue
        magicDamageDealt = statsJson["magicDamageDealt"].uIntValue
        physicalDamageDealt = statsJson["physicalDamageDealt"].uIntValue
        trueDamageDealt = statsJson["trueDamageDealt"].uIntValue
        
        largestCriticalStrike = statsJson["largestCriticalStrike"].uIntValue
        
        totalDamageDealtToChampions = statsJson["totalDamageDealtToChampions"].uIntValue
        
        totalHeal = statsJson["totalHeal"].uIntValue
        totalUnitsHealed = statsJson["totalUnitsHealed"].uIntValue
        
        damageSelfMitigated = statsJson["damageSelfMitigated"].uIntValue
        
        damageDealtToObjectives = statsJson["damageDealtToObjectives"].uIntValue
        damageDealtToTurrets = statsJson["damageDealtToTurrets"].uIntValue
        
        timeCCingOthers = statsJson["timeCCingOthers"].uIntValue
        
        totalDamageTaken = statsJson["totalDamageTaken"].uIntValue
        magicalDamageTaken = statsJson["magicalDamageTaken"].uIntValue
        physicalDamageTaken = statsJson["physicalDamageTaken"].uIntValue
        trueDamageTaken = statsJson["trueDamageTaken"].uIntValue
        
        goldEarned = statsJson["goldEarned"].uIntValue
        goldSpent = statsJson["goldSpent"].uIntValue
        
        turretKills = statsJson["turretKills"].uIntValue
        inhibitorKills = statsJson["inhibitorKills"].uIntValue
        
        totalMinionsKilled = statsJson["totalMinionsKilled"].uIntValue
        neutralMinionsKilled = statsJson["neutralMinionsKilled"].uIntValue
        neutralMinionsKilledTeamJungle = statsJson["neutralMinionsKilledTeamJungle"].uIntValue
        neutralMinionsKilledEnemyJungle = statsJson["neutralMinionsKilledEnemyJungle"].uIntValue
        totalTimeCrowdControlDealt = statsJson["totalTimeCrowdControlDealt"].uIntValue
        
        champLevel = statsJson["champLevel"].uIntValue
        
        wardsPlaced = statsJson["wardsPlaced"].uIntValue
        wardsKilled = statsJson["wardsKilled"].uIntValue
        
        firstBloodKill = statsJson["firstBloodKill"].boolValue
        firstBloodAssist = statsJson["firstBloodAssist"].boolValue
        
        firstTowerKill = statsJson["firstTowerKill"].boolValue
        firstTowerAssist = statsJson["firstTowerAssist"].boolValue
        firstInhibitorKill = statsJson["firstInhibitorKill"].boolValue
        firstInhibitorAssist = statsJson["firstInhibitorAssist"].boolValue
        
        
        let creepsPerMinDeltasJson = timeLineJson["creepsPerMinDeltas"]
        let xpPerMinDeltasJson = timeLineJson["xpPerMinDeltas"]
        let goldPerMinDeltasJson = timeLineJson["goldPerMinDeltas"]
        let csDiffPerMinDeltasJson = timeLineJson["csDiffPerMinDeltas"]
        let xpDiffPerMinDeltasJson = timeLineJson["xpDiffPerMinDeltas"]
        let damageTakenPerMinDeltasJson = timeLineJson["damageTakenPerMinDeltas"]
        let damageTakenDiffPerMinDeltasJson = timeLineJson["damageTakenDiffPerMinDeltas"]
        
        creepsPerMinDeltas = Deltas(json: creepsPerMinDeltasJson)
        xpPerMinDeltas = Deltas(json: xpPerMinDeltasJson)
        goldPerMinDeltas = Deltas(json: goldPerMinDeltasJson)
        csDiffPerMinDeltas = Deltas(json: csDiffPerMinDeltasJson)
        xpDiffPerMinDeltas = Deltas(json: xpDiffPerMinDeltasJson)
        damageTakenPerMinDeltas = Deltas(json: damageTakenPerMinDeltasJson)
        damageTakenDiffPerMinDeltas = Deltas(json: damageTakenDiffPerMinDeltasJson)
        
        let laneJsonValue = timeLineJson["lane"].stringValue
        lane = Lane.init(rawValue: laneJsonValue)
    }
}
