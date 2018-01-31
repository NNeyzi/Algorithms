//
//  Magician and Chocolates.swift
//  
//
//  Created by Nader Neyzi on 1/30/18.
//

import Foundation

/*
 Given N bags, each bag contains Ai chocolates. There is a kid and a magician. In one unit of time, kid chooses a random bag i, eats Ai chocolates, then the magician fills the ith bag with floor(Ai/2) chocolates.

 Given Ai for 1 <= i <= N, find the maximum number of chocolates kid can eat in K units of time.

 For example,

 K = 3
 N = 2
 A = 6 5

 Return: 14
 At t = 1 kid eats 6 chocolates from bag 0, and the bag gets filled by 3 chocolates
 At t = 2 kid eats 5 chocolates from bag 1, and the bag gets filled by 2 chocolates
 At t = 3 kid eats 3 chocolates from bag 0, and the bag gets filled by 1 chocolate
 so, total number of chocolates eaten: 6 + 5 + 3 = 14

 Note: Return your answer modulo 10^9+7
 */

func nchoc(_ A: inout Int, _ B: inout [Int]) -> Int {
    if B.count == 0 { return 0 }

    var queue:[Int] = []

    for bag in B {
        queue.insert(bag, at: 0)
    }

    return check(&queue, &A)
}

func check(_ queue: inout [Int], _ A: inout Int) -> Int {
    var ans = 0
    var division = Int(pow(Double(10), 9)) + 7

    while A > 0 {
        var top = queue.last

        ans = (ans + (top! % division)) % division

        queue.removeLast()
        queue.insert(top!/2, at: 0)

        A -= 1
    }

    return ans
}
