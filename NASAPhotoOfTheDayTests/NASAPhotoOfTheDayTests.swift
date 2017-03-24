//
//  NASAPhotoOfTheDayTests.swift
//  NASAPhotoOfTheDayTests
//
//  Created by Ginny Pennekamp on 3/17/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import NASAPhotoOfTheDay


class NASAPhotoOfTheDayTests: XCTestCase {
    
    var requestUnderTest: NASARequest!
    
    override func setUp() {
        super.setUp()
        requestUnderTest = NASARequest()
    }
    
    override func tearDown() {
        requestUnderTest = nil
        super.tearDown()
    }
    
    func testRequestURL() {
        let url = requestUnderTest.buildURL()
        let assertEqualToURL = "https://api.nasa.gov/planetary/apod?api_key=\(YOUR_API_KEY)"
        XCTAssertEqual(url, URL(string: assertEqualToURL), "The URL is NOT correct")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
