//
//  CalcModel.swift
//  calc
//
//  Created by Le Cai on 2018/3/26.
//  Copyright © 2018年 UTS. All rights reserved.
//

import Foundation


struct CalcBrain {
    private var infixExperssion : [String]
    private var result : Int?
    
    //Constructor
    init(infixExperssion:[String]){
        self.infixExperssion = infixExperssion
    }
    //Return the converted postfix
    mutating func postfix() throws -> String? {
        let experssionUtils = Experssion(inputExperssion: self.infixExperssion)
        do {
            let postfix = try experssionUtils.postfix()
            return postfix;
        } catch {
            throw error
        }
    }
    //Return the result calculated by the postfix
    mutating func evaluate() throws -> Int? {
        let experssionUtils = Experssion(inputExperssion: self.infixExperssion)
        do {
            let result = try experssionUtils.evaluate()
            self.result = result
            return self.result
        } catch {
            throw error
        }
    }


}
