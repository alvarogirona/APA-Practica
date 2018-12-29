//
//  ChampionsWinrates.swift
//  Alamofire
//
//  Created by alvaro on 29/12/2018.
//

import SwiftyJSON

class ChampionsWinrates {
    var winRates: [UInt: Double]!
    
    init(json: JSON) {
        winRates = [UInt: Double]()
        
        let champsArray = json.arrayValue
        
        for champ in champsArray {
            let id = champ["_id"]["championId"].uIntValue
            let winRate = champ["winRate"].doubleValue
            
            winRates[id] = winRate
        }
    }
}
