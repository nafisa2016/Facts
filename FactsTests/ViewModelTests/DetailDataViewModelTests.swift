//
//  DetailDataViewModelTests.swift
//  FactsTests
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest
@testable import Facts

class DetailDataViewModelTests: XCTestCase {
    
    let detailDataViewModel = DetailDataViewModel()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        detailDataViewModel.detailDataModel = DetailDataModel(rowTitle: "AA", rowImgHref: "BB", rowDescription: "CC")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK:- test getRowTitle
    func testgetRowTitle() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let rowTitle = detailDataViewModel.getRowTitle()
        XCTAssertEqual(rowTitle, "AA")
    }
    
    //MARK:- test getRowImgHref
    func testgetRowImgHref() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let rowImgHref = detailDataViewModel.getRowImgHref()
        XCTAssertEqual(rowImgHref, "BB")
    }
    
    //MARK:- test getRowDescription
    func testgetRowDescription() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let rowDescription = detailDataViewModel.getRowDescription()
        XCTAssertEqual(rowDescription, "CC")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
