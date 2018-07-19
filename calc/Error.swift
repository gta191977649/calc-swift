//
//  Error.swift
//  calc
//
//  Created by Le Cai on 2018/4/2.
//  Copyright © 2018年 UTS. All rights reserved.
//

import Foundation

enum CalulatorError : Error{
    case divisionByZero
    case invailOperator (operator: String)
    case invailNumber (number:String)
    case inCompleteExperssion
}

