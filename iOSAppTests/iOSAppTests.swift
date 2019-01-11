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
    var controller: ViewController!
    
    override func setUp() {
        super.setUp()
        controller = ViewController()
        print(controller.view.description)
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
    
    func testTableView()  {
        XCTAssertNotNil(controller.detailTableView)
    }
    
    func testTableViewDataSource() {
        XCTAssertTrue((controller.detailTableView.dataSource  != nil))
    }
    
    func testTableViewDelegate() {
        XCTAssertTrue((controller.detailTableView.delegate  != nil))
    }
    
    func testTableViewCellForRowAtIndexPath() {
        let indexPath = NSIndexPath.init(row: 0, section: 0)
        let cell = controller.tableView(controller.detailTableView, cellForRowAt: indexPath as IndexPath) as! DetailTableViewCell
        XCTAssertNotNil(cell.titleLabel.text)
        XCTAssertNotNil(cell.detailedLabel.text)
        XCTAssertNotNil(cell.imageViewHeader.image)
    }
    
    func testRefreshControlExist()  {
        XCTAssertNotNil(controller.detailTableView.refreshControl)
    }        
    
}
