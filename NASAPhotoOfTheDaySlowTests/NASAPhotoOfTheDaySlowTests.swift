//
//  NASAPhotoOfTheDaySlowTests.swift
//  NASAPhotoOfTheDaySlowTests
//
//  Created by Ginny Pennekamp on 3/17/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import NASAPhotoOfTheDay


class NASAPhotoOfTheDaySlowTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    var urlUnderTest: NASARequest!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToNASAAPIGetsHTTPStatusCode200() {
        let url = urlUnderTest.buildURL()
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Asynchronous test: faster fail
    func testCallToNASAAPICompletes() {
        let url = urlUnderTest.buildURL()
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        let dataTask = sessionUnderTest.dataTask(with: url) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
