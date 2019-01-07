//
//  iOSAppTests.swift
//  iOSAppTests
//
//  Created by Himanshu Lanjewar on 03/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import XCTest
//import Foundation

@testable import iOSApp

class iOSAppTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //continueAfterFailure = false
        //app = XCUIApplication()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testTableInteraction() {
//        app.launch()
//        
//        // Assert that we are displaying the tableview
//        let detailTableView = app.tables["table--detailTableView"]
//        
//        XCTAssertTrue(detailTableView.exists, "The article tableview exists")
//        
//        // Get an array of cells
//        //let tableCells = detailTableView.cells
//        
//    }


    
}
