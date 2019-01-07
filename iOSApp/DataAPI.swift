  //
//  DataAPI.swift
//  iOSApp
//
//  Created by Nishigandha Rajurkar on 04/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
  
typealias DataResponseCompletion = ([DataModel],String) -> Void
class DataAPI {
    
    static func GetDetailData(url: String, completion: @escaping DataResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url)
            .responseString { response in
                
                if((response.result.value) != nil) {
                    
                    if let dataFromString = response.result.value?.data(using: .utf8, allowLossyConversion: false) {
                        let json = JSON(data: dataFromString)
                        var rows = [DataModel]()
                        let headerTitle: String = json["title"].stringValue
                        let dataJson = json["rows"]
                        
                        for subJson in dataJson.arrayValue {
                            rows.append(DataModel(rowTitle: subJson["title"].string,
                                                  rowDescription: subJson["description"].string,
                                                  rowImageHref: subJson["imageHref"].string))
                        }
                        completion(rows, headerTitle)
                    }
                }

                if let error = response.result.error {
                    debugPrint(error.localizedDescription)
                    completion([], "")
                    return
                }
            }
    }
    
}
