//
//  Utils.swift
//  Fractions
//
//  Created by Marcos Garcia on 9/24/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import Foundation

class Utils {
    
    /// This function returns the fraction with the output format -> [Number?]_[numerator]/[denominator]
    func formatFraction(fraction: Fraction) -> String {
        var str = ""
        if let number = fraction.number {
            str = str + "\(number)_"
        }
        
        str = str + "\(fraction.numerator)" + "/" + "\(fraction.denominator)"
        return str
    }
    
    /// Converts an improper fraction into a mixed number, for calculation purposes
    func convertToMixedNumber(fraction: Fraction) -> Fraction {
        let number = abs(fraction.numerator / fraction.denominator)
        let numerator = fraction.numerator - (number*fraction.denominator)
        
        var theNumber: Int?
        
        if number == 0 {
            theNumber = nil
        } else {
            theNumber = number
        }
        
        let result = Fraction(number: theNumber, numerator: numerator, denominator: fraction.denominator)
        return result
    }
    
    /// Based on greatest common divisor simplifies the fraction
    func simplifyFraction(fraction: Fraction) -> Fraction {
        var theNumerator = 0
        
        if fraction.numerator < 0 {
            theNumerator = abs(fraction.numerator)
        } else {
            theNumerator = fraction.numerator
        }
        
        let divisor = gcd(a: theNumerator, b: fraction.denominator)
        let numerator = fraction.numerator / divisor
        let denominator = fraction.denominator / divisor
        
        let simplifiedFraction = Fraction(number: nil, numerator: numerator, denominator: denominator)
        return simplifiedFraction
    }
    
    /// Transforms a mixed number fraction into a improper function so it can be easy to read by the users
    func convertToImproper(fraction: Fraction) -> Fraction? {
        if let number = fraction.number {
            let new = number * fraction.denominator + fraction.numerator
            return Fraction(number: nil, numerator: new, denominator: fraction.denominator)
        }
        return nil
    }
    
    /// Determines if a fraction is a mixed number fraction representation
    func isMixedNumbersFraction(fraction: Fraction) -> Bool {
        if fraction.number != nil {
            return true
        }
        return false
    }
    
    /// Returns an array of elements that represents the fractions
    func getElements(input: String) -> [String]? {
        let elements = input.components(separatedBy: " ")
        
        guard let first = elements.first,
            let last = elements.last else {
                return nil
        }
        
        return [first, last]
    }
    
    /// Returns the operator between fractions
    func getOperator(input: String) -> String {
        let elements = input.components(separatedBy: " ")
        return elements[1]
    }
    
    /// Creates a fraction based on an input string
    func createFraction(element: String) -> Fraction? {
        let elements = element.components(separatedBy: "_")
        var number: Int?
        
        if elements.count == 2 {
            guard let first = elements.first else {
                return nil
            }
            number = Int(first)
        }
        
        let fractionComponents = elements.last?.components(separatedBy: "/")
        
        guard let firstFraction = fractionComponents?.first,
            let lastFraction = fractionComponents?.last else {
                return nil
        }
        
        guard let num = Int(firstFraction),
            let den = Int(lastFraction) else {
                return nil
        }
        
        return Fraction(number: number, numerator: num, denominator: den)
    }
}

private extension Utils {
    /// Private function to get greatest common divisor of two numbers
    func gcd(a:Int, b:Int) -> Int {
        if a == b {
            return a
        }
        else {
            if a > b {
                return gcd(a:a-b,b:b)
            }
            else {
                return gcd(a:a,b:b-a)
            }
        }
    }
}
