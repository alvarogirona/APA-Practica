//
//  NetworkController.swift
//  Alamofire
//
//  Created by alvaro on 08/12/2018.
//

import Alamofire
import SwiftyJSON

class NetworkController {
    func getData() {
        Alamofire.request("http://api.champion.gg/v2/champions?champData=winRate&limit=200&abriged=true&api_key=ced2a4b07b103defef765957839727c3").responseString { (response) in
            response.result.ifSuccess {
                let str = response.result.value
                let winRatesJson = JSON(parseJSON: str!)
                let championsWinRates = ChampionsWinrates(json: winRatesJson)
             
                Alamofire.request("https://s3-us-west-1.amazonaws.com/riot-developer-portal/seed-data/matches10.json").responseString { (response) in
                    response.result.ifSuccess {
                        let str = response.result.value
                        let json = JSON(parseJSON: str!)
                        let converter = JSONToCSV()
                        converter.convert(json: json, winRates: championsWinRates)
                    }
                }
            }
        }
    }
}
