//
//  iOSAppDataModel.swift
//  iOSApp
//
//  Created by Himanshu Lanjewar on 11/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import XCTest
@testable import iOSApp
class iOSAppDataModel: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDetailDataModel()  {
        let item = DataModel(rowTitle: "test", rowDescription: "test1", rowImageHref:"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
        XCTAssertEqual(item.rowTitle!, "test")
        XCTAssertEqual(item.rowDescription!, "test1")
        XCTAssertEqual(item.rowImageHref!, "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
        
        XCTAssertNotNil(item.rowTitle!)
        XCTAssertNotNil(item.rowDescription!)
        XCTAssertNotNil(item.rowImageHref!)
    }

}
