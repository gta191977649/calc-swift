//
//  Experssion.swift
//  calc
//
//  Created by Le Cai on 2018/3/26.
//  Copyright © 2018年 UTS. All rights reserved.
//

import Foundation

//Deal with experssion conversion
struct Experssion {
    private let experssion : [String]
    private let operatorUtil = Operator()
    
    //Constrctor
    init(inputExperssion : [String]) {
        self.experssion = inputExperssion
    }
    //infix to postfix conversion
    func postfix() throws -> String? {
        //postfix buffer
        var postFix : String = ""
        var op = Stack<String>()
        /*
            Check if the experssion is not finish
            e.g: 3 + 4 / , 6 / 3 +
         */
        if isEven(toCheckNumebr: self.experssion.count) {
            throw CalulatorError.inCompleteExperssion
        }
        for (index,element) in self.experssion.enumerated() {
            //print("Index: \(index) expr: \(element)")
            if isEven(toCheckNumebr : index) { //This case has to be number
                if isNumber(toCheckString: element) {
                    postFix.append(element)
                } else { //throw error
                    throw CalulatorError.invailNumber(number: element)
                }
            } else { //This case has to be operator
                if isOperator(toCheckString: element) {
                    var tmpChar : String?
                    switch (element) {
                    case "+","-":
                        postFix.append(" ")
                        while !op.isEmpty() {
                            tmpChar = op.pop()
                            if tmpChar == "("{
                                op.push(item: tmpChar!)
                                break
                            }
                            postFix.append(tmpChar!)
                            postFix.append(" ")
                        }
                        op.push(item: element)
                        break
                    case "x","/","%":
                        postFix.append(" ")
                        while !op.isEmpty() {
                            tmpChar = op.pop()
                            if tmpChar == "(" || tmpChar == "+" || tmpChar == "-" {
                                op.push(item: tmpChar!)
                                break
                            } else {
                                postFix.append(tmpChar!)
                                postFix.append(" ")
                            }
                        }
                        op.push(item: element)
                        break
                
                    default:
                        break
                    }
                } else { //When is not vail operator
                    throw CalulatorError.invailOperator(operator: element)
                }
            }
        
        }
        //pop all the operators in the stack
        while !op.isEmpty() {
            postFix.append(" ")
            postFix.append(op.pop())
        }
        return postFix;
    }
    // evaluate the calculation result from converted postfix experssion
    func evaluate() throws -> Int? {
        do {
            let postfix = try self.postfix()
            var numberStack = Stack<Int>()
            if let postfixSplit = postfix?.components(separatedBy: " ") { //if the postfix experssion is vaild
                for each in postfixSplit {
                    //when is number push to stack
                    if isNumber(toCheckString: each) {
                        numberStack.push(item: Int(each)!)
                    } else { //when is operator pop 2 number in stack, calculate them
                        let y = numberStack.pop()
                        let x = numberStack.pop()
                        let result = try operatorUtil.performCalculation(x, y, each)
                        numberStack.push(item: result!)
                    }
                }
                //pop out the last result
                return numberStack.pop();
            }
            
        } catch {
            throw error
        }
        return nil
    }
    //Helper functions
    func isNumber(toCheckString inputString : String) -> Bool {
        return Int(inputString) != nil
    }
    func isOperator(toCheckString inputString : String) -> Bool {
        let vailOperators = ["+","-","x","/","%"]
        return vailOperators.contains(inputString)
    }
    func isEven(toCheckNumebr checkNumer : Int) -> Bool {
        return checkNumer % 2 == 0
    }
}
/*
    Reference:
        En.wikipedia.org. (n.d.). Shunting-yard algorithm. [online] Available at: https://en.wikipedia.org/wiki/Shunting-yard_algorithm [Accessed 25 Mar. 2018].
        Geekswithblogs.net. (2010). Algorithm for Infix to Postfix. [online] Available at: http://geekswithblogs.net/venknar/archive/2010/07/09/algorithm-for-infix-to-postfix.aspx [Accessed 25 Mar. 2018].
 
*/
