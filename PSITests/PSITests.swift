//
//  PSITests.swift
//  PSITests
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import XCTest

@testable import PSI

class PSITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testDateToString() {
        let str = "2018-04-15T00:00:00+08:00"
        let date = Date(fromString: str)
        if let strResult = date?.formatterString() {
            XCTAssertEqual(str, strResult)
        }else
        {
            XCTFail()
        }
        
        
    }
    
    func testStringToDate() {
        let str = "2018-04-15T00:00:00+08:00"
        let date = Date(fromString: str)
        XCTAssertNotNil(date);
    }
}
