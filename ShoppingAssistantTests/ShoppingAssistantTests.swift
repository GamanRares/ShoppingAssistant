//
//  ShoppingAssistantTests.swift
//  ShoppingAssistantTests
//
//  Created by Gaman Rares-Constantin on 10/9/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import XCTest
@testable import ShoppingAssistant

class ShoppingAssistantTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUtilsSha256() {
        
        XCTAssertEqual("9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", Utils().sha256(stringToEncrypt: "test"))
        XCTAssertEqual("60303ae22b998861bce3b28f33eec1be758a213c86c93c076dbe9f558c11c752", Utils().sha256(stringToEncrypt: "test2"))
        XCTAssertNotEqual("9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", Utils().sha256(stringToEncrypt: "test2"))
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
