//
//  Stairs.swift
//  
//
//  Created by Nader Neyzi on 2/28/18.
//

import Foundation

/*
 You are climbing a stair case. It takes n steps to reach to the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example :

 Input : 3
 Return : 3

 Steps : [1 1 1], [1 2], [2 1]

 */

func climbStairs(_ A: inout Int) -> Int {
    var memo:[Int] = [1,2]
    return recurseClimbStairs(&A, &memo)
}

func recurseClimbStairs(_ A: inout Int, _ memo: inout [Int]) -> Int {
    if A <= memo.count { return memo[(A-1)] }
    var minus1 = A - 1
    var minus2 = A - 2
    memo.append(recurseClimbStairs(&minus1, &memo) + recurseClimbStairs(&minus2, &memo))

    return memo[(A-1)]
}
