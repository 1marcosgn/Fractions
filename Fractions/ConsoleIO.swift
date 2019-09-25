//
//  ConsoleIO.swift
//  Fractions
//
//  Created by Marcos Garcia on 9/24/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        writeMessage("usage:")
        writeMessage("\(executableName) -a string1 string2")
        writeMessage("or")
        writeMessage("\(executableName) -p string")
        writeMessage("or")
        writeMessage("\(executableName) -h to show usage information")
        writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    func getTest(input: String) -> String {
        return input
    }
}


class Fractions {
    
    enum OptionType: String {
        case fractions = "?"
        case help = "h"
        case quit = "q"
        case unknown
        
        init(value: String) {
            switch value {
                case "?": self = .fractions
                case "h": self = .help
                case "q": self = .quit
                default: self = .unknown
            }
        }
    }
    
    let consoleIO = ConsoleIO()
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Fractions. This program takes operations on fractions as an input and produce a fractional result.")

        var shouldQuit = false
        while !shouldQuit {

            consoleIO.writeMessage("Type '?' to start or 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .fractions:
                consoleIO.writeMessage("Type the fractions separated by operand (Example: 1/2 * 3_3/4):")
                let first = consoleIO.getInput()
                
                if let result = consoleIO.produceFractionalResult(input: first) {
                    consoleIO.writeMessage("= \(result)")
                } else {
                    consoleIO.writeMessage("Please enter two fractions separated by operator -> Example: 1/2 * 3_3/4)")
                }
        
            case .help:
                consoleIO.writeMessage("This program takes operations on fractions as an input and produce a fractional result.")
                consoleIO.writeMessage("Example input:? 1/2 * 3_3/4")
                consoleIO.writeMessage("Example output: 1_7/8")
                
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
}


extension ConsoleIO {
    
    /// Take operations on fractions as an input and produce a fractional result
    func produceFractionalResult(input: String) -> String? {
        
        let operator_ = Utils().getOperator(input: input)
        var fractions = [Fraction]()
        var updatedFractions = [Fraction]()
        
        guard let elements = Utils().getElements(input: input) else {
            return nil
        }
        
        for element in elements {
            if let fraction = Utils().createFraction(element: element) {
                fractions.append(fraction)
            }
        }
        
        for fraction in fractions {
            if Utils().isMixedNumbersFraction(fraction: fraction) {
                if let newFrac = Utils().convertToImproper(fraction: fraction) {
                    updatedFractions.append(newFrac)
                }
            } else {
                updatedFractions.append(fraction)
            }
        }
        
        var result: Fraction
        
        switch operator_ {
        case "*":
            result = Operations().multiplyFractions(fractionA: updatedFractions.first!, fractionB: updatedFractions.last!)
        case "+", "-":
            result = Operations().addSubstractFractions(fractionA: updatedFractions.first!, fractionB: updatedFractions.last!, operation: operator_)
        case "/":
            result = Operations().divideFractions(fractionA: updatedFractions.first!, fractionB: updatedFractions.last!)
        default:
            result = Operations().multiplyFractions(fractionA: updatedFractions.first!, fractionB: updatedFractions.last!)
        }
        
        result = Utils().convertToMixedNumber(fraction: result)
        return Utils().formatFraction(fraction: result)
    }
}
