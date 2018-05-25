//
//  FactsFeedCollectionViewControllerTests.swift
//  FactsTests
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest
@testable import Facts

class FactsFeedCollectionViewControllerTests: XCTestCase {
    
    var factsFeedCollectionViewController : FactsFeedCollectionViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        factsFeedCollectionViewController = storyboard.instantiateViewController(withIdentifier: "FactsFeedCollectionViewController") as! FactsFeedCollectionViewController
        
        factsFeedCollectionViewController.loadView()
        factsFeedCollectionViewController.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK:- test whether collection view exists
    func testCollectionViewExists() {
        XCTAssertNotNil(factsFeedCollectionViewController.collectionView)
    }
    
    //MARK:- test whether collection view conforms to flow layout delegate
    func testCollectionViewConforms() {
        XCTAssert(factsFeedCollectionViewController.conforms(to: UICollectionViewDelegateFlowLayout.self), "collection view controller does not conform to protocol")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
