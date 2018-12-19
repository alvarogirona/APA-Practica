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
        Alamofire.request("https://s3-us-west-1.amazonaws.com/riot-developer-portal/seed-data/matches1.json").responseString { (response) in
            response.result.ifSuccess {
                let str = response.result.value
                let json = JSON(parseJSON: str!)
                let converter = JSONToCSV()
                converter.convert(json: json)
            }
        }
    }
}
