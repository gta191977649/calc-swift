//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
/*
func printDebug(_ args : [String]) {
    var stringBuffer : String = ""
    for characters in args {
        stringBuffer.append(" "+characters)
    }
    print("Debug: parsed input as \(stringBuffer)")
}
*/
func main(_ args : [String]) {
    //printDebug(args)
    var calcModel = CalcBrain(infixExperssion: args)
    do {
        let result = try calcModel.evaluate()
        print(result!)
    } catch CalulatorError.divisionByZero {
        print("Division by zero")
        exit(2)
    } catch CalulatorError.inCompleteExperssion {
        print("Incomplete expression. Expected input of the form [number] [operator number ...]")
        exit(3)
    } catch CalulatorError.invailNumber(let number) {
        print("Invalid number: \(number)")
        exit(4)
    } catch CalulatorError.invailOperator(let op) {
        print("Unknown operator: \(op)")
        exit(5)
    } catch {
        print("Unknown Error")
        exit(1)
    }
}
main(args) // <-- entry function


