import SwiftyJSON
import Foundation

class JSONToCSV {
    func convert(json: JSON) {
        var matches = [Match]()
        let matchesJson = json["matches"].arrayValue
        
        for jsonMatch in matchesJson {
            let match = Match(json: jsonMatch)
            matches.append(match)
        }
        
        exit(EXIT_SUCCESS)
    }
    
    func printMatches(matches: [Match]) {
        for match in matches {
            
        }
    }
}
