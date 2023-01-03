//
//  CalculationTest.swift
//  CalculationUnitTest
//
//  Created by Jisu Jang on 2022/09/19.
//

import XCTest
@testable import ReviewWQuestion_Calculator


final class CalculationTest: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(calculations(sign: "×", a: 12.0, b: 6.23), 74.760)
        XCTAssertEqual(calculations(sign: "÷", a: 12.34, b: 0), 12.3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
