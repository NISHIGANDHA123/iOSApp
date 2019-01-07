//
//  DataAPI.swift
//  iOSApp
//
//  Created by Nishigandha Rajurkar on 04/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import Alamofire
import SwiftyJSON
  
typealias DataResponseSuccessCompletion = ([DataModel],String) -> Void
typealias DataResponseFailureCompletion = (Error) -> Void

// A Class to get the row data from the server
class DataAPI {
    
    /**
     Get the row data from server.
     
     parameter 
        - url: A server url
        - success: Success completion block
        - failure: failure completioon block
    **/
    static func GetDetailData(url: String,
                              success: @escaping DataResponseSuccessCompletion,
                              failure: @escaping DataResponseFailureCompletion) {
        
        guard let url = URL(string: url) else { return }
        Alamofire.request(url)
            .responseString { response in
                if((response.result.value) != nil) {
                    
                    if let dataFromString = response.result.value?.data(using: .utf8, allowLossyConversion: false) {
                        let json = JSON(data: dataFromString)
                        var rows = [DataModel]()
                        let headerTitle: String = json[Constants.JSON_KEY_TITLE_MAIN].stringValue
                        let dataJson = json[Constants.JSON_KEY_ROW]
                        
                        for subJson in dataJson.arrayValue {
                            rows.append(DataModel(rowTitle: subJson[Constants.JSON_KEY_TITLE].string,
                                                  rowDescription: subJson[Constants.JSON_KEY_DESCRIPTION].string,
                                                  rowImageHref: subJson[Constants.JSON_KEY_IMAGE].string))
                        }
                        success(rows, headerTitle)
                    }
                }

                if let error = response.result.error {
                    debugPrint(error.localizedDescription)
                    failure(error)
                    return
                }
            }
    }
    
}
