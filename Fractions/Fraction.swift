//
//  Fraction.swift
//  Fractions
//
//  Created by Marcos Garcia on 9/24/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import Foundation

/// This struct represents a Fraction, it contains an optional number, a required numerator and denominator
struct Fraction {
    let number: Int?
    let numerator: Int
    let denominator: Int
    
    /// Initializes the Fraction object
    init(number: Int?, numerator: Int, denominator: Int) {
        self.number = number
        self.numerator = numerator
        self.denominator = denominator
    }
}
