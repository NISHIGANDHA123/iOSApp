  //
//  DataAPI.swift
//  iOSApp
//
//  Created by Himanshu Lanjewar on 04/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
  
class DataAPI {
    
    func getDetailData(url: String, completion: @escaping DataResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url, encoding: URLEncoding.default).responseJSON { (response) in
            guard let json = response.result.value as? [String: Any] else { return completion(nil)}
            let jsonData = self.parseDataManual(json : json)
            completion(jsonData)
            
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
        }
    }
    
    
    // Parsing function using manual methods
    private func parseDataManual(json: [String: Any]) -> DataModel {
        let title = json["title"] as? String ?? ""
        let rows = json["rows"] as? [String] ?? [String]()
        //let description = json["description"] as? String ?? ""
        //let imageHref = json["imageHref"] as? String ?? ""

        
        return DataModel(title: title, rows: rows, description: "", imageHref: "")
    }

}
