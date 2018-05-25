//
//  FactsFeedViewModelTests.swift
//  FactsTests
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest
@testable import Facts

class FactsFeedViewModelTests: XCTestCase {
    
    var factsFeedViewModel : FactsFeedViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        factsFeedViewModel = FactsFeedViewModel()
        let row = Row(title: "AAA", description: "This is unit testing", imageHref: "bbb")
        var rows = [Row]()
        rows.append(row)
        factsFeedViewModel.factsFeedModel = FactsFeedModel(title: "A", rows: rows)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK:- test getNumOfSections method
    func testgetNumOfSections() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let numOfSection = factsFeedViewModel.getNumOfSections()
        XCTAssertEqual(numOfSection, 1)
    }
    
    //MARK:- test getNumOfSections method
    func testgetNumOfItems() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        let numOfItems = factsFeedViewModel.getNumOfItems()
        XCTAssertEqual(numOfItems, 1)
    }
    
    //MARK:- test getNavBarTitle method
    func testgetNavBarTitle() {
        
        let row = Row(title: "AAA", description: "This is unit testing", imageHref: "bbb")
        var rows = [Row]()
        rows.append(row)
        factsFeedViewModel.factsFeedModel = FactsFeedModel(title: "A", rows: rows)
        
        let navBarTitle = factsFeedViewModel.getNavBarTitle()
        XCTAssertEqual(navBarTitle, "A")
    }
    
    //MARK:- test getCellTitle
    func testgetCellTitle() {
        
        let row = Row(title: "AAA", description: "This is unit testing", imageHref: "bbb")
        var rows = [Row]()
        rows.append(row)
        factsFeedViewModel.factsFeedModel = FactsFeedModel(title: "A", rows: rows)
        
        let rowTitle = factsFeedViewModel.getCellTitle(index: 0)
        XCTAssertEqual(rowTitle, "AAA")
    }
    
    
    //MARK:- test getCellDescription
    func testgetCellDescription() {
        
        let row = Row(title: "AAA", description: "This is unit testing", imageHref: "bbb")
        var rows = [Row]()
        rows.append(row)
        factsFeedViewModel.factsFeedModel = FactsFeedModel(title: "A", rows: rows)
        
        let cellDesc = factsFeedViewModel.getCellDescription(index: 0)
        XCTAssertEqual(cellDesc, "This is unit testing")
    }
    
    //MARK:- test getCellImgHref
    func testgetCellImgHref() {
        
        let row = Row(title: "AAA", description: "This is unit testing", imageHref: "bbb")
        var rows = [Row]()
        rows.append(row)
        factsFeedViewModel.factsFeedModel = FactsFeedModel(title: "A", rows: rows)
        
        let cellImgHref = factsFeedViewModel.getCellImgHref(index: 0)
        XCTAssertEqual(cellImgHref, "bbb")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
