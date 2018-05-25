//
//  DetailDataModelTests.swift
//  FactsTests
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest
@testable import Facts

class DetailDataModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK:- test for detail data model
    func testDetailDataModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let dtlDataModel = DetailDataModel(rowTitle: "aa", rowImgHref: "bb", rowDescription: "ccc")
        
        //test row title
        XCTAssertEqual(dtlDataModel.rowTitle,"aa")
        
        //test row image href
        XCTAssertEqual(dtlDataModel.rowImgHref,"bb")
        
        //test row description
        XCTAssertEqual(dtlDataModel.rowDescription,"ccc")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
