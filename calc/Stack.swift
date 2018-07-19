//
//  stack.swift
//  calc
//
//  Created by Le Cai on 2018/3/24.
//  Copyright © 2018年 UTS. All rights reserved.
//
//  this is the simple implmentation for the Stack data structure.

import Foundation

struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    mutating func size() -> Int {
        return items.count
    }
    mutating func isEmpty() -> Bool {
        return items.count == 0
    }
}

/*
    Reference:
        Lau, K. (2016). Swift Algorithm Club: Swift Stack Data Structure. [online] Ray Wenderlich. Available at: https://www.raywenderlich.com/149213/swift-algorithm-club-swift-stack-data-structure [Accessed 25 Mar. 2018].
*/

