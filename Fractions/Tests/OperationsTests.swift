//
//  OperationsTests.swift
//  Fractions-Tests
//
//  Created by Marcos Garcia on 9/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class OperationsTests: XCTestCase {

    func test_divideFractions_CaseA() {
        
        let fractionA = Utils().createFraction(element: "3/4")
        let fractionB = Utils().createFraction(element: "5/7")
        
        let result = Operations().divideFractions(fractionA: fractionA!, fractionB: fractionB!)
    
        XCTAssertNotNil(result, "Result should not be nil")
        XCTAssertNil(result.number, "Number should be nil")
        XCTAssertEqual(result.numerator, 21, "Numerator should match")
        XCTAssertEqual(result.denominator, 20, "Denominator should match")
    }

    func test_multiplyFractions_CaseA() {
        let fractionA = Utils().createFraction(element: "3/4")
        let fractionB = Utils().createFraction(element: "5/7")
        
        let result = Operations().multiplyFractions(fractionA: fractionA!, fractionB: fractionB!)
        
        XCTAssertNotNil(result, "Result should not be nil")
        XCTAssertNil(result.number, "Number should be nil")
        XCTAssertEqual(result.numerator, 15, "Numerator should match")
        XCTAssertEqual(result.denominator, 28, "Denominator should match")
    }
    
    
    func test_addFractions_CaseA() {
        let fractionA = Utils().createFraction(element: "3/4")
        let fractionB = Utils().createFraction(element: "5/7")
        
        let result = Operations().addSubstractFractions(fractionA: fractionA!, fractionB: fractionB!, operation: "+")
        
        XCTAssertNotNil(result, "Result should not be nil")
        XCTAssertNil(result.number, "Number should be nil")
        XCTAssertEqual(result.numerator, 41, "Numerator should match")
        XCTAssertEqual(result.denominator, 28, "Denominator should match")
    }
    
    func test_substractFractions_CaseA() {
        let fractionA = Utils().createFraction(element: "3/4")
        let fractionB = Utils().createFraction(element: "5/7")
        
        let result = Operations().addSubstractFractions(fractionA: fractionA!, fractionB: fractionB!, operation: "-")
        
        XCTAssertNotNil(result, "Result should not be nil")
        XCTAssertNil(result.number, "Number should be nil")
        XCTAssertEqual(result.numerator, 1, "Numerator should match")
        XCTAssertEqual(result.denominator, 28, "Denominator should match")
    }
}
