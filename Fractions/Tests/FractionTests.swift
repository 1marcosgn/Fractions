//
//  FractionTests.swift
//  Fractions-Tests
//
//  Created by Marcos Garcia on 9/24/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class FractionTests: XCTestCase {

    func test_Fraction_Should_Be_Created_Successfully_With_All_Parameters() {
        
        let fraction = Fraction(number: 1, numerator: 2, denominator: 4)

        XCTAssertNotNil(fraction, "Fraction object should not be nil")
        XCTAssertEqual(fraction.number, 1, "Number should match")
        XCTAssertEqual(fraction.numerator, 2, "Numerator should match")
        XCTAssertEqual(fraction.denominator, 4, "Denominator should match")
    }
    
    func test_Fraction_Should_Be_Created_Successfully_With_Only_Numerator_Denominatot() {
        
        let fraction = Fraction(number: nil, numerator: 2, denominator: 4)

        XCTAssertNotNil(fraction, "Fraction object should not be nil")
        XCTAssertNil(fraction.number, "Number should be nil")
        XCTAssertEqual(fraction.numerator, 2, "Numerator should match")
        XCTAssertEqual(fraction.denominator, 4, "Denominator should match")
    }
}
