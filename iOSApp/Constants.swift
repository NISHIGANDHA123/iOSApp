//
//  Constants.swift
//  iOSApp
//
//  Created by Nishigandha Rajurkar on 03/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import UIKit
class Constants {
    public static let DATA_URL: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    static let CORNER_RADIUS = 35
    
    static let TITLE_LABEL = UIFont.boldSystemFont(ofSize: 20)
    static let DETAIL_LABEL = UIFont.boldSystemFont(ofSize: 14)
    
    static let kColor_title:UIColor = UIColor.blue
    static let kColor_detailedLabel: UIColor = UIColor.black
    
    static let BG_COLOR_TABLE = UIColor.white
    
    static let BAR_TINT_COLOR = UIColor.brown
    static let TITLE_TEXT_ATTRIBUTE = UIColor.black
    
    static let PLACEHOLDER_IMAGE = "loader"
    static let NO_IMAGE_AVAILABLE = "noimage"
    
    static let cellReuseIdentifier = "detailCell"
    static let EPMTY_STRING = ""
    static let PULL_TO_REFRESH = "Pull down to refresh"
    
    static let TABLE_HEIGHT = 150
    static let NO_INTERNET_TITLE = "No Internet Connection"
    static let NO_INTERNET_MESSAGE = "Make sure your device is connected to the internet."
    static let ALERT_ACTION = "OK"
    
    static let API_ERROR_TITLE = "Error!"
    static let API_ERROR_MESSAGE = "Data not available"
    
    static let JSON_KEY_TITLE_MAIN = "title"
    static let JSON_KEY_ROW = "rows"
    static let JSON_KEY_TITLE = "title"
    static let JSON_KEY_DESCRIPTION = "description"
    static let JSON_KEY_IMAGE = "imageHref"
}
                                                 
