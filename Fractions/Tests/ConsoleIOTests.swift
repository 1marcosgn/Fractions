//
//  ConsoleIOTests.swift
//  Fractions-Tests
//
//  Created by Marcos Garcia on 9/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class ConsoleIOTests: XCTestCase {
    
    var consoleIO: ConsoleIO?

    override func setUp() {
        consoleIO = ConsoleIO()
    }
    
    override func tearDown() {
        consoleIO = nil
    }

    func test_produceFractionalResult_CaseA() {
        let input = "1/2 * 3_3/4"
        let output = "1_7/8"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }
    
    func test_produceFractionalResult_CaseB() {
        let input = "2/3 * 1_5/4"
        let output = "1_1/2"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_CaseC() {
        let input = "2/3 * 5/4"
        let output = "5/6"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_CaseD() {
        let input = "2/3 * 5/4"
        let output = "5/6"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_CaseE() {
        let input = "10/9 * 1/4"
        let output = "5/18"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_CaseF() {
        let input = "100/4 * 4_1/6"
        let output = "104_1/6"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_G() {
        let input = "2_3/8 + 9/8"
        let output = "3_1/2"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_H() {
        let input = "3/8 + 9/8"
        let output = "1_1/2"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_I() {
        let input = "3/8 - 9/8"
        let output = "-3/4"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_J() {
        let input = "9/8 - 3/8"
        let output = "3/4"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_L() {
        let input = "1_9/8 - 1_3/2"
        let output = "-3/8"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_M() {
        let input = "3/4 / 5/7"
        let output = "1_1/20"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }

    func test_produceFractionalResult_Case_N() {
        let input = "5/7 / 3/4"
        let output = "20/21"
        XCTAssertEqual(consoleIO!.produceFractionalResult(input: input), output)
    }
}
