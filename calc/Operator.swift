//
//  ExperssionTerm.swift
//  calc
//
//  Created by Le Cai on 2018/3/27.
//  Copyright © 2018年 UTS. All rights reserved.
//

import Foundation

struct Operator {
    //enum operation stores all operation type
    private enum Operation {
        case binaryOperation ((Int,Int) -> Int)
        //can be add more ...
    }
    //a dictionary to store all the operation symbols and corresponding actions
    private var operationSymbols = [
        "+": Operation.binaryOperation({$0 + $1}),
        "-": Operation.binaryOperation({$0 - $1}),
        "x": Operation.binaryOperation({$0 * $1}),
        "/": Operation.binaryOperation({$0 / $1}),
        "%": Operation.binaryOperation({$0 % $1})
    ]
    
    //perform the calculation by two number
    func performCalculation(_ x : Int,_ y : Int,_ symbol : String ) throws -> Int? {
        var result : Int?
        if let operation = operationSymbols[symbol] { //if the symbol is found on the dictionary
            switch operation {
            case .binaryOperation(let function):
                if symbol == "/" || symbol == "%" { //Deal with devision by zero error
                    if y == 0 {
                        throw CalulatorError.divisionByZero
                    }
                }
                result = function(x,y)
                break
            }
        }
        return result
    }
}
/*
    Reference:
        Deiman, M. (2017). Lecture 2: MVC; iOS, Xcode and Swift Demonstration. [online] YouTube. Available at: https://www.youtube.com/watch?v=-auG-myu02Q&index=1&list=PLPA-ayBrweUz32NSgNZdl0_QISw-f12Ai [Accessed 28 Mar. 2018].
*/
