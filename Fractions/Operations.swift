//
//  Operations.swift
//  Fractions
//
//  Created by Marcos Garcia on 9/24/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import Foundation

class Operations {
    
    /// Divides a fraction using the formula: ab÷cd=ab⋅dc=adbc
    func divideFractions(fractionA: Fraction, fractionB: Fraction) -> Fraction {
        let numerator = fractionA.numerator * fractionB.denominator
        let denominator = fractionA.denominator * fractionB.numerator
        let resultFraction = Fraction(number: nil, numerator: numerator, denominator: denominator)
        return Utils().simplifyFraction(fraction: resultFraction)
    }
    
    /// Multiplies a fraction using the formula:  ab⋅cd=acbd
    func multiplyFractions(fractionA: Fraction, fractionB: Fraction) -> Fraction {
        let numerator = fractionA.numerator * fractionB.numerator
        let denominator = fractionA.denominator * fractionB.denominator
        let resultFraction = Fraction(number: nil, numerator: numerator, denominator: denominator)
        return Utils().simplifyFraction(fraction: resultFraction)
    }
    
    /// Adds or substracts using the formula:
    /*
     1) Find the least common denominator
     2) Write both original fractions as equivalent fractions with the least common denominator.
     3) Add (or subtract) the numerators.
     4) Write the result with the denominator.
     */
    func addSubstractFractions(fractionA: Fraction, fractionB: Fraction, operation: String ) -> Fraction {
        
        let denominator = fractionA.denominator * fractionB.denominator
        let numerator:Int
        
        if operation == "+" {
            numerator = (fractionA.numerator * fractionB.denominator) + (fractionB.numerator * fractionA.denominator)
        } else {
            numerator = (fractionA.numerator * fractionB.denominator) - (fractionB.numerator * fractionA.denominator)
        }
        
        let resultFraction = Fraction(number: nil, numerator: numerator, denominator: denominator)
        return Utils().simplifyFraction(fraction: resultFraction)
    }
}
