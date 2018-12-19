//
//  Deltas.swift
//  riot_json_csv
//
//  Created by alvaro on 08/12/2018.
//

import SwiftyJSON

class Deltas {
    var from0to10: Double!
    var from10to20: Double!
    var from20to30: Double!
    var from30toEnd: Double!
    
    init(json: JSON) {
        from0to10 = json["0-10"].doubleValue
        from10to20 = json["10-20"].doubleValue
        from20to30 = json["20-30"].doubleValue
        from30toEnd = json["30-end"].doubleValue
    }
}
