//
//  ParticipantStats.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

enum Lane: String {
    case top = "TOP"
    case jungle = "JUNGLE"
    case mid = "MID"
    case support = "DUO_SUPPORT"
    case bottom = "DUO_CARRY"
}

class ParticipantStats {
    var win: Bool!
    var itemsId: [UInt]!
    
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
    
    var creepsPerMinDeltas: [Deltas]! // Creep score difference versus the calculated lane opponent(s) for a specified period.
    var xpPerMinDeltas: [Deltas]! // Experience change for a specified period.
    var goldPerMinDeltas: [Deltas]! // Gold for a specified period.
    var csDiffPerMinDeltas: [Deltas]!
    var xpDiffPerMinDeltas: [Deltas]! // Experience difference versus the calculated lane opponent(s) for a specified period.
    var damageTakenPerMinDeltas: [Deltas]!
    var damageTakenDiffPerMinDeltas: [Deltas]!
    
    var lane: Lane!
}
