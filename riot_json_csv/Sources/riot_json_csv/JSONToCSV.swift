import SwiftyJSON
import Foundation

class JSONToCSV {
    func convert(json: JSON, winRates: ChampionsWinrates) {
        var matches = [Match]()
        let matchesJson = json["matches"].arrayValue
        
        for jsonMatch in matchesJson {
            let match = Match(json: jsonMatch)
            
            matches.append(match)
        }
//        printMatchesDeltas(matches: matches)
        matchesWithWinratesAndDeltas(matches: matches, winRates: winRates)
        
        exit(EXIT_SUCCESS)
    }
    
    func convertLocal(winRates: ChampionsWinrates) {
        let fileManager = FileManager.default
        let documentsURL = try! fileManager.contentsOfDirectory(atPath: "/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/data")
        
        var match: Match!
        if let fileHandle = FileHandle(forWritingAtPath: "/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/20k_matches.csv") {
            printMatchesWinRatesDeltasHeaders(fileHandle: fileHandle)
            
            for file in documentsURL {
                let data = fileManager.contents(atPath: "/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/data/" + file)
                let json = JSON(data!)
                match = Match(json: json)
                fileHandle.seekToEndOfFile()
                // We only want matches with more than 20 minutes
                if (match.gameDuration/60 > 20) {
                    printMatchWithWinratesAndDeltas(match: match, winRates: winRates, fileHandle: fileHandle)
                }
                match = nil
            }
            
            fileHandle.closeFile()
        }
        exit(EXIT_SUCCESS)
    }
    
    private func printMatchWithWinratesAndDeltas(match: Match, winRates: ChampionsWinrates, fileHandle: FileHandle) {
        // MARK: TEAM 0 DELTAS
        let team0creepsPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.creepsPerMinDeltas.from0to10
        }
        
        let team0creepsPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.creepsPerMinDeltas.from10to20
        }
        
        let team0XpPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpPerMinDeltas.from0to10
        }
        
        let team0XpPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpPerMinDeltas.from10to20
        }
        
        let team0GoldPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.goldPerMinDeltas.from0to10
        }
        
        let team0GoldPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.goldPerMinDeltas.from10to20
        }
        
        let team0CsDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.csDiffPerMinDeltas.from0to10
        }
        
        let team0CsDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.csDiffPerMinDeltas.from10to20
        }
        
        let team0XpDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpDiffPerMinDeltas.from0to10
        }
        
        let team0XpDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpDiffPerMinDeltas.from10to20
        }
        
        let team0DamageTakenPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenPerMinDeltas.from0to10
        }
        
        let team0DamageTakenPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenPerMinDeltas.from10to20
        }
        
        let team0DamageTakenDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
        }
        
        let team0DamageTakenDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
        }
        
        
        // MARK: TEAM 1 DELTAS
        let team1creepsPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.creepsPerMinDeltas.from0to10
        }
        
        let team1creepsPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.creepsPerMinDeltas.from10to20
        }
        
        let team1XpPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpPerMinDeltas.from0to10
        }
        
        let team1XpPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpPerMinDeltas.from10to20
        }
        
        let team1GoldPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.goldPerMinDeltas.from0to10
        }
        
        let team1GoldPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.goldPerMinDeltas.from10to20
        }
        
        let team1CsDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.csDiffPerMinDeltas.from0to10
        }
        
        let team1CsDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.csDiffPerMinDeltas.from10to20
        }
        
        let team1XpDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpDiffPerMinDeltas.from0to10
        }
        
        let team1XpDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.xpDiffPerMinDeltas.from10to20
        }
        
        let team1DamageTakenPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenPerMinDeltas.from0to10
        }
        
        let team1DamageTakenPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenPerMinDeltas.from10to20
        }
        
        let team1DamageTakenDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
        }
        
        let team1DamageTakenDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
            return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
        }
        
        
        let matchStr = """
        \(match.winner ? 0 : 1)\t
        
        \(team0creepsPerMinDeltas0to10)\t
        \(team0creepsPerMinDeltas10to20)\t
        \(team0XpPerMinDeltas0to10)\t
        \(team0XpPerMinDeltas10to20)\t
        \(team0GoldPerMinDeltas0to10)\t
        \(team0GoldPerMinDeltas10to20)\t
        \(team0CsDiffPerMinDeltas0to10)\t
        \(team0CsDiffPerMinDeltas10to20)\t
        \(team0XpDiffPerMinDeltas0to10)\t
        \(team0XpDiffPerMinDeltas10to20)\t
        \(team0DamageTakenPerMinDeltas0to10)\t
        \(team0DamageTakenPerMinDeltas10to20)\t
        \(team0DamageTakenDiffPerMinDeltas0to10)\t
        \(team0DamageTakenDiffPerMinDeltas10to20)\t
        
        \(winRates.winRates[match.teams[0].participants[0].championId]!) \t
        \(winRates.winRates[match.teams[0].participants[1].championId]!) \t
        \(winRates.winRates[match.teams[0].participants[2].championId]!) \t
        \(winRates.winRates[match.teams[0].participants[3].championId]!) \t
        \(winRates.winRates[match.teams[0].participants[4].championId]!) \t
        
        \(team1creepsPerMinDeltas0to10)\t
        \(team1creepsPerMinDeltas10to20)\t
        \(team1XpPerMinDeltas0to10)\t
        \(team1XpPerMinDeltas10to20)\t
        \(team1GoldPerMinDeltas0to10)\t
        \(team1GoldPerMinDeltas10to20)\t
        \(team1CsDiffPerMinDeltas0to10)\t
        \(team1CsDiffPerMinDeltas10to20)\t
        \(team1XpDiffPerMinDeltas0to10)\t
        \(team1XpDiffPerMinDeltas10to20)\t
        \(team1DamageTakenPerMinDeltas0to10)\t
        \(team1DamageTakenPerMinDeltas10to20)\t
        \(team1DamageTakenDiffPerMinDeltas0to10)\t
        \(team1DamageTakenDiffPerMinDeltas10to20)\t
        
        \(winRates.winRates[match.teams[1].participants[0].championId]!) \t
        \(winRates.winRates[match.teams[1].participants[1].championId]!) \t
        \(winRates.winRates[match.teams[1].participants[2].championId]!) \t
        \(winRates.winRates[match.teams[1].participants[3].championId]!) \t
        \(winRates.winRates[match.teams[1].participants[4].championId]!)
        """
        fileHandle.write(matchStr
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\t", with: ",")
            .replacingOccurrences(of: " ", with: "")
            .appending("\n")
            .data(using: .utf8)!)

        //print(matchStr.replacingOccurrences(of: "\n", with: " "))
    }
    
    private func printMatchesWinRatesDeltasHeaders(fileHandle: FileHandle) {
        let headers =   """
        winner \t

        t0_cs_min_0_10 \t
        t0_cs_min_10_20 \t
        t0_xp_min_0_10 \t
        t0_xp_min_10_20 \t
        t0_gold_min_0_10 \t
        t0_gold_min_10_20 \t
        t0_cs_diff_min_0_10 \t
        t0_cs_diff_min_10_20 \t
        t0_xp_diff_min_0_10 \t
        t0_xp_diff_min_10_20 \t
        t0_dmg_taken_min_0_10 \t
        t0_dmg_taken_min_10_20 \t
        t0_dmg_taken_diff_0_10 \t
        t0_dmg_taken_diff_10_20 \t

        t0_c0_wr \t
        t0_c1_wr \t
        t0_c2_wr \t
        t0_c3_wr \t
        t0_c4_wr \t

        t1_cs_min_0_10 \t
        t1_cs_min_10_20 \t
        t1_xp_min_0_10 \t
        t1_xp_min_10_20 \t
        t1_gold_min_0_10 \t
        t1_gold_min_10_20 \t
        t1_cs_diff_min_0_10 \t
        t1_cs_diff_min_10_20 \t
        t1_xp_diff_min_0_10 \t
        t1_xp_diff_min_10_20 \t
        t1_dmg_taken_min_0_10 \t
        t1_dmg_taken_min_10_20 \t
        t1_dmg_taken_diff_0_10 \t
        t1_dmg_taken_diff_10_20 \t

        t1_c0_wr \t
        t1_c1_wr \t
        t1_c2_wr \t
        t1_c3_wr \t
        t1_c4_wr
        """
        
        fileHandle.write(headers
            .replacingOccurrences(of: "\t", with: ",")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: " ", with: "")
            .appending("\n")
            .data(using: .utf8)!)
        //print(headers.replacingOccurrences(of: "\t", with: ",").replacingOccurrences(of: "\n", with: ""))
    }
    
    func matchesWithWinratesAndDeltas(matches: [Match], winRates: ChampionsWinrates) {
        let headers =   """
        winner \t

        t0_cs_min_0_10 \t
        t0_cs_min_10_20 \t
        t0_xp_min_0_10 \t
        t0_xp_min_10_20 \t
        t0_gold_min_0_10 \t
        t0_gold_min_10_20 \t
        t0_cs_diff_min_0_10 \t
        t0_cs_diff_min_10_20 \t
        t0_xp_diff_min_0_10 \t
        t0_xp_diff_min_10_20 \t
        t0_dmg_taken_min_0_10 \t
        t0_dmg_taken_min_10_20 \t
        t0_dmg_taken_diff_0_10 \t
        t0_dmg_taken_diff_10_20 \t

        t0_c0_wr \t
        t0_c1_wr \t
        t0_c2_wr \t
        t0_c3_wr \t
        t0_c4_wr \t

        t1_cs_min_0_10 \t
        t1_cs_min_10_20 \t
        t1_xp_min_0_10 \t
        t1_xp_min_10_20 \t
        t1_gold_min_0_10 \t
        t1_gold_min_10_20 \t
        t1_cs_diff_min_0_10 \t
        t1_cs_diff_min_10_20 \t
        t1_xp_diff_min_0_10 \t
        t1_xp_diff_min_10_20 \t
        t1_dmg_taken_min_0_10 \t
        t1_dmg_taken_min_10_20 \t
        t1_dmg_taken_diff_0_10 \t
        t1_dmg_taken_diff_10_20 \t

        t1_c0_wr \t
        t1_c1_wr \t
        t1_c2_wr \t
        t1_c3_wr \t
        t1_c4_wr \t
        """
        
        print(headers.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\t", with: ","))
        for match in matches {
            
            // MARK: TEAM 0 DELTAS
            let team0creepsPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from0to10
            }
            
            let team0creepsPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from10to20
            }
            
            let team0XpPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from0to10
            }
            
            let team0XpPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from10to20
            }
            
            let team0GoldPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from0to10
            }
            
            let team0GoldPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from10to20
            }
            
            let team0CsDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from0to10
            }
            
            let team0CsDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from10to20
            }
            
            let team0XpDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from0to10
            }
            
            let team0XpDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from10to20
            }
            
            let team0DamageTakenPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from0to10
            }
            
            let team0DamageTakenPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from10to20
            }
            
            let team0DamageTakenDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
            }
            
            let team0DamageTakenDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
            }
            
            
            // MARK: TEAM 1 DELTAS
            let team1creepsPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from0to10
            }
            
            let team1creepsPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from10to20
            }
            
            let team1XpPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from0to10
            }
            
            let team1XpPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from10to20
            }
            
            let team1GoldPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from0to10
            }
            
            let team1GoldPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from10to20
            }
            
            let team1CsDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from0to10
            }
            
            let team1CsDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from10to20
            }
            
            let team1XpDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from0to10
            }
            
            let team1XpDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from10to20
            }
            
            let team1DamageTakenPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from0to10
            }
            
            let team1DamageTakenPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from10to20
            }
            
            let team1DamageTakenDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
            }
            
            let team1DamageTakenDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
            }
            
            
            let matchStr = """
            \(match.winner ? 0 : 1)\t
            
            \(team0creepsPerMinDeltas0to10)\t
            \(team0creepsPerMinDeltas10to20)\t
            \(team0XpPerMinDeltas0to10)\t
            \(team0XpPerMinDeltas10to20)\t
            \(team0GoldPerMinDeltas0to10)\t
            \(team0GoldPerMinDeltas10to20)\t
            \(team0CsDiffPerMinDeltas0to10)\t
            \(team0CsDiffPerMinDeltas10to20)\t
            \(team0XpDiffPerMinDeltas0to10)\t
            \(team0XpDiffPerMinDeltas10to20)\t
            \(team0DamageTakenPerMinDeltas0to10)\t
            \(team0DamageTakenPerMinDeltas10to20)\t
            \(team0DamageTakenDiffPerMinDeltas0to10)\t
            \(team0DamageTakenDiffPerMinDeltas10to20)\t
            
            \(winRates.winRates[match.teams[0].participants[0].championId]!) \t
            \(winRates.winRates[match.teams[0].participants[1].championId]!) \t
            \(winRates.winRates[match.teams[0].participants[2].championId]!) \t
            \(winRates.winRates[match.teams[0].participants[3].championId]!) \t
            \(winRates.winRates[match.teams[0].participants[4].championId]!) \t
            
            \(team1creepsPerMinDeltas0to10)\t
            \(team1creepsPerMinDeltas10to20)\t
            \(team1XpPerMinDeltas0to10)\t
            \(team1XpPerMinDeltas10to20)\t
            \(team1GoldPerMinDeltas0to10)\t
            \(team1GoldPerMinDeltas10to20)\t
            \(team1CsDiffPerMinDeltas0to10)\t
            \(team1CsDiffPerMinDeltas10to20)\t
            \(team1XpDiffPerMinDeltas0to10)\t
            \(team1XpDiffPerMinDeltas10to20)\t
            \(team1DamageTakenPerMinDeltas0to10)\t
            \(team1DamageTakenPerMinDeltas10to20)\t
            \(team1DamageTakenDiffPerMinDeltas0to10)\t
            \(team1DamageTakenDiffPerMinDeltas10to20)
            
            \(winRates.winRates[match.teams[1].participants[0].championId]!) \t
            \(winRates.winRates[match.teams[1].participants[1].championId]!) \t
            \(winRates.winRates[match.teams[1].participants[2].championId]!) \t
            \(winRates.winRates[match.teams[1].participants[3].championId]!) \t
            \(winRates.winRates[match.teams[1].participants[4].championId]!) \t
            """
            print(matchStr.replacingOccurrences(of: "\n", with: " "))
        }
    }
    

    func printMatchesDeltas(matches: [Match]) {
        let headers =   """
        winner \t

        t0_cs_min_0_10 \t
        t0_cs_min_10_20 \t
        t0_xp_min_0_10 \t
        t0_xp_min_10_20 \t
        t0_gold_min_0_10 \t
        t0_gold_min_10_20 \t
        t0_cs_diff_min_0_10 \t
        t0_cs_diff_min_10_20 \t
        t0_xp_diff_min_0_10 \t
        t0_xp_diff_min_10_20 \t
        t0_dmg_taken_min_0_10 \t
        t0_dmg_taken_min_10_20 \t
        t0_dmg_taken_diff_0_10 \t
        t0_dmg_taken_diff_10_20 \t

        t1_cs_min_0_10 \t
        t1_cs_min_10_20 \t
        t1_xp_min_0_10 \t
        t1_xp_min_10_20 \t
        t1_gold_min_0_10 \t
        t1_gold_min_10_20 \t
        t1_cs_diff_min_0_10 \t
        t1_cs_diff_min_10_20 \t
        t1_xp_diff_min_0_10 \t
        t1_xp_diff_min_10_20 \t
        t1_dmg_taken_min_0_10 \t
        t1_dmg_taken_min_10_20 \t
        t1_dmg_taken_diff_0_10 \t
        t1_dmg_taken_diff_10_20 \t
        """
        
        print(headers.replacingOccurrences(of: "\n", with: " "))
        for match in matches {
            
            // MARK: TEAM 0 DELTAS
            let team0creepsPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from0to10
            }
            
            let team0creepsPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from10to20
            }
            
            let team0XpPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from0to10
            }
            
            let team0XpPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from10to20
            }
            
            let team0GoldPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from0to10
            }
            
            let team0GoldPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from10to20
            }
            
            let team0CsDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from0to10
            }
            
            let team0CsDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from10to20
            }
            
            let team0XpDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from0to10
            }
            
            let team0XpDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from10to20
            }
            
            let team0DamageTakenPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from0to10
            }
            
            let team0DamageTakenPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from10to20
            }
            
            let team0DamageTakenDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
            }
            
            let team0DamageTakenDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
            }
            
            
            // MARK: TEAM 1 DELTAS
            let team1creepsPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from0to10
            }
            
            let team1creepsPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from10to20
            }
            
            let team1XpPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from0to10
            }
            
            let team1XpPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from10to20
            }
            
            let team1GoldPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from0to10
            }
            
            let team1GoldPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from10to20
            }
            
            let team1CsDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from0to10
            }
            
            let team1CsDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from10to20
            }
            
            let team1XpDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from0to10
            }
            
            let team1XpDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from10to20
            }
            
            let team1DamageTakenPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from0to10
            }
            
            let team1DamageTakenPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from10to20
            }
            
            let team1DamageTakenDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
            }
            
            let team1DamageTakenDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
            }
            
            
            let matchStr = """
            \(match.winner ? 0 : 1)\t
            
            \(team0creepsPerMinDeltas0to10)\t
            \(team0creepsPerMinDeltas10to20)\t
            \(team0XpPerMinDeltas0to10)\t
            \(team0XpPerMinDeltas10to20)\t
            \(team0GoldPerMinDeltas0to10)\t
            \(team0GoldPerMinDeltas10to20)\t
            \(team0CsDiffPerMinDeltas0to10)\t
            \(team0CsDiffPerMinDeltas10to20)\t
            \(team0XpDiffPerMinDeltas0to10)\t
            \(team0XpDiffPerMinDeltas10to20)\t
            \(team0DamageTakenPerMinDeltas0to10)\t
            \(team0DamageTakenPerMinDeltas10to20)\t
            \(team0DamageTakenDiffPerMinDeltas0to10)\t
            \(team0DamageTakenDiffPerMinDeltas10to20)\t
            
            \(team1creepsPerMinDeltas0to10)\t
            \(team1creepsPerMinDeltas10to20)\t
            \(team1XpPerMinDeltas0to10)\t
            \(team1XpPerMinDeltas10to20)\t
            \(team1GoldPerMinDeltas0to10)\t
            \(team1GoldPerMinDeltas10to20)\t
            \(team1CsDiffPerMinDeltas0to10)\t
            \(team1CsDiffPerMinDeltas10to20)\t
            \(team1XpDiffPerMinDeltas0to10)\t
            \(team1XpDiffPerMinDeltas10to20)\t
            \(team1DamageTakenPerMinDeltas0to10)\t
            \(team1DamageTakenPerMinDeltas10to20)\t
            \(team1DamageTakenDiffPerMinDeltas0to10)\t
            \(team1DamageTakenDiffPerMinDeltas10to20)
            """
            print(matchStr.replacingOccurrences(of: "\n", with: " "))
        }
    }
    
    func printMatchesAllData(matches: [Match]) {
        // winner - team1 deltas - team2 deltas
        let headers =   """
        winner \t

        t0_baron_kills \t
        t0_first_baron \t
        t0_dragon_kills \t
        t0_first_dragon \t
        t0_first_blood \t
        t0_first_inhib \t
        t0_first_herald \t
        t0_first_tower \t
        t0_inhib_kills \t
        t0_herald_kills \t

        t0_cs_min_0_10 \t
        t0_cs_min_10_20 \t
        t0_xp_min_0_10 \t
        t0_xp_min_10_20 \t
        t0_gold_min_0_10 \t
        t0_gold_min_10_20 \t
        t0_cs_diff_min_0_10 \t
        t0_cs_diff_min_10_20 \t
        t0_xp_diff_min_0_10 \t
        t0_xp_diff_min_10_20 \t
        t0_dmg_taken_min_0_10 \t
        t0_dmg_taken_min_10_20 \t
        t0_dmg_taken_diff_0_10 \t
        t0_dmg_taken_diff_10_20 \t

        t1_baron_kills \t
        t1_first_baron \t
        t1_dragon_kills \t
        t1_first_dragon \t
        t1_first_blood \t
        t1_first_inhib \t
        t1_first_herald \t
        t1_first_tower \t
        t1_inhib_kills \t
        t1_herald_kills \t

        t1_cs_min_0_10 \t
        t1_cs_min_10_20 \t
        t1_xp_min_0_10 \t
        t1_xp_min_10_20 \t
        t1_gold_min_0_10 \t
        t1_gold_min_10_20 \t
        t1_cs_diff_min_0_10 \t
        t1_cs_diff_min_10_20 \t
        t1_xp_diff_min_0_10 \t
        t1_xp_diff_min_10_20 \t
        t1_dmg_taken_min_0_10 \t
        t1_dmg_taken_min_10_20 \t
        t1_dmg_taken_diff_0_10 \t
        t1_dmg_taken_diff_10_20 \t
        """
        print(headers.replacingOccurrences(of: "\n", with: " "))
        for match in matches {
            
            // MARK: TEAM 0 DELTAS
            let team0creepsPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from0to10
            }
            
            let team0creepsPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from10to20
            }
            
            let team0XpPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from0to10
            }
            
            let team0XpPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from10to20
            }
            
            let team0GoldPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from0to10
            }
            
            let team0GoldPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from10to20
            }
            
            let team0CsDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from0to10
            }
            
            let team0CsDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from10to20
            }
            
            let team0XpDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from0to10
            }
            
            let team0XpDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from10to20
            }
            
            let team0DamageTakenPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from0to10
            }
            
            let team0DamageTakenPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from10to20
            }
            
            let team0DamageTakenDiffPerMinDeltas0to10 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
            }
            
            let team0DamageTakenDiffPerMinDeltas10to20 = match.teams[0].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
            }
            
            
            // MARK: TEAM 1 DELTAS
            let team1creepsPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from0to10
            }
            
            let team1creepsPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.creepsPerMinDeltas.from10to20
            }
            
            let team1XpPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from0to10
            }
            
            let team1XpPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpPerMinDeltas.from10to20
            }
            
            let team1GoldPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from0to10
            }
            
            let team1GoldPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.goldPerMinDeltas.from10to20
            }
            
            let team1CsDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from0to10
            }
            
            let team1CsDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.csDiffPerMinDeltas.from10to20
            }
            
            let team1XpDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from0to10
            }
            
            let team1XpDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.xpDiffPerMinDeltas.from10to20
            }
            
            let team1DamageTakenPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from0to10
            }
            
            let team1DamageTakenPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenPerMinDeltas.from10to20
            }
            
            let team1DamageTakenDiffPerMinDeltas0to10 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from0to10
            }
            
            let team1DamageTakenDiffPerMinDeltas10to20 = match.teams[1].participants.reduce(0.0) { (res, part) -> Double in
                return res + part.stats.damageTakenDiffPerMinDeltas.from10to20
            }
            
            
            let matchStr = """
            \(match.winner ? 0 : 1)\t
            
            \(match.teams[0].baronKills!)\t
            \(match.teams[0].firstBaron ? 0 : 1)\t
            \(match.teams[0].dragonKills!)\t
            \(match.teams[0].firstDragon ? 0 : 1)\t
            \(match.teams[0].firstBlood ? 0 : 1)\t
            \(match.teams[0].firstInhibitor ? 0 : 1)\t
            \(match.teams[0].firstRiftHerald ? 0 : 1)\t
            \(match.teams[0].firstTower ? 0 : 1)\t
            \(match.teams[0].inhibitorKills!)\t
            \(match.teams[0].riftHeraldKills!)\t
            
            \(team0creepsPerMinDeltas0to10)\t
            \(team0creepsPerMinDeltas10to20)\t
            \(team0XpPerMinDeltas0to10)\t
            \(team0XpPerMinDeltas10to20)\t
            \(team0GoldPerMinDeltas0to10)\t
            \(team0GoldPerMinDeltas10to20)\t
            \(team0CsDiffPerMinDeltas0to10)\t
            \(team0CsDiffPerMinDeltas10to20)\t
            \(team0XpDiffPerMinDeltas0to10)\t
            \(team0XpDiffPerMinDeltas10to20)\t
            \(team0DamageTakenPerMinDeltas0to10)\t
            \(team0DamageTakenPerMinDeltas10to20)\t
            \(team0DamageTakenDiffPerMinDeltas0to10)\t
            \(team0DamageTakenDiffPerMinDeltas10to20)\t
            
            \(match.teams[1].baronKills!)\t
            \(match.teams[1].firstBaron ? 0 : 1)\t
            \(match.teams[1].dragonKills!)\t
            \(match.teams[1].firstDragon ? 0 : 1)\t
            \(match.teams[1].firstBlood ? 0 : 1)\t
            \(match.teams[1].firstInhibitor ? 0 : 1)\t
            \(match.teams[1].firstRiftHerald ? 0 : 1)\t
            \(match.teams[1].firstTower ? 0 : 1)\t
            \(match.teams[1].inhibitorKills!)\t
            \(match.teams[1].riftHeraldKills!)\t
            
            \(team1creepsPerMinDeltas0to10)\t
            \(team1creepsPerMinDeltas10to20)\t
            \(team1XpPerMinDeltas0to10)\t
            \(team1XpPerMinDeltas10to20)\t
            \(team1GoldPerMinDeltas0to10)\t
            \(team1GoldPerMinDeltas10to20)\t
            \(team1CsDiffPerMinDeltas0to10)\t
            \(team1CsDiffPerMinDeltas10to20)\t
            \(team1XpDiffPerMinDeltas0to10)\t
            \(team1XpDiffPerMinDeltas10to20)\t
            \(team1DamageTakenPerMinDeltas0to10)\t
            \(team1DamageTakenPerMinDeltas10to20)\t
            \(team1DamageTakenDiffPerMinDeltas0to10)\t
            \(team1DamageTakenDiffPerMinDeltas10to20)
            """
            print(matchStr.replacingOccurrences(of: "\n", with: " "))
        }
    }
}
