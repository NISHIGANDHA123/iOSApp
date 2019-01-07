//
//  Connectivity.swift
//  iOSApp
//
//  Created by Nishigandha Rajurkar on 04/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//
import Foundation
import Alamofire

// A Class to check the network connectivity.
class Reachability {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
