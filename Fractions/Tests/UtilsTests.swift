//
//  UtilsTests.swift
//  Fractions-Tests
//
//  Created by Marcos Garcia on 9/24/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class UtilsTests: XCTestCase {
    
    func test_formatFraction_CaseA() {
        let fraction = Fraction(number: 1, numerator: 2, denominator: 4)
        XCTAssertEqual(Utils().formatFraction(fraction: fraction), "1_2/4", "Format should return right format for the fraction")
    }
    
    func test_formatFraction_CaseB() {
        let fraction = Fraction(number: nil, numerator: 2, denominator: 4)
        XCTAssertEqual(Utils().formatFraction(fraction: fraction), "2/4", "Format should return right format for the fraction")
    }

    func test_convertToMixedNumber_CaseA() {
        let fraction = Fraction(number: 1, numerator: 2, denominator: 4)
        let mixedFraction = Utils().convertToMixedNumber(fraction: fraction)
        
        XCTAssertNotNil(mixedFraction)
        XCTAssertNil(mixedFraction.number, "Number should be nil for mixed numbers")
        XCTAssertEqual(mixedFraction.numerator, 2, "Numerator should match")
        XCTAssertEqual(mixedFraction.denominator, 4, "Denominator should match")
    }
    
    func test_simplifyFraction_CaseA() {
        
        let fraction = Fraction(number: nil, numerator: 4, denominator: 8)
        let simplifiedFraction = Utils().simplifyFraction(fraction: fraction)
        
        XCTAssertNotNil(simplifiedFraction, "Simplified fraction should not be nil")
        XCTAssertNil(simplifiedFraction.number, "Number in simplified fraction should be nil")
        XCTAssertEqual(simplifiedFraction.numerator, 1, "Numerator should match")
        XCTAssertEqual(simplifiedFraction.denominator, 2, "Denominator should match")
    }
    
    
    func test_convertToImproper_CaseA() {
        
        let fraction = Fraction(number: 1, numerator: 30, denominator: 2)
        let improperFraction = Utils().convertToImproper(fraction: fraction)
        
        XCTAssertNotNil(improperFraction, "Improper fraction should not be nil")
        XCTAssertNil(improperFraction?.number, "Should be nil")
        XCTAssertEqual(improperFraction?.numerator, 32, "Numerator should match")
        XCTAssertEqual(improperFraction?.denominator, 2, "Denominator should match")
    }
    
    func test_isMixedNumbersFraction_CaseA() {
        
        let fraction = Fraction(number: nil, numerator: 4, denominator: 8)
        XCTAssertFalse(Utils().isMixedNumbersFraction(fraction: fraction), "Fraction is not a mixed number fraction representation")
        
    }
    
    func test_isMixedNumbersFraction_CaseB() {
        
        let fraction = Fraction(number: 1, numerator: 4, denominator: 8)
        XCTAssertTrue(Utils().isMixedNumbersFraction(fraction: fraction), "Fraction is a mixed number fraction representation")
        
    }
    
    func test_getElements_CaseA() {
        let input = "1/2 * 3_3/4"
        let output = Utils().getElements(input: input)
        XCTAssertEqual(output?.count, 2)
        XCTAssertEqual(output, ["1/2", "3_3/4"], "Output should match")
    }
    
    func test_createFraction_CaseA() {
        
        let input = "1/2"
        let fraction = Utils().createFraction(element: input)
        
        XCTAssertNotNil(fraction, "Fraction should not be nil")
        XCTAssertNil(fraction?.number, "Number should be nil")
        XCTAssertEqual(fraction?.numerator, 1, "Numerator should match")
        XCTAssertEqual(fraction?.denominator, 2, "Denominator should match")
    }
    
    func test_createFraction_CaseB() {
        
        let input = "3_1/2"
        let fraction = Utils().createFraction(element: input)
        
        XCTAssertNotNil(fraction, "Fraction should not be nil")
        XCTAssertEqual(fraction?.number, 3, "Number should match")
        XCTAssertEqual(fraction?.numerator, 1, "Numerator should match")
        XCTAssertEqual(fraction?.denominator, 2, "Denominator should match")
    }
}
