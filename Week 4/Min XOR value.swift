//
//  Min XOR value.swift
//  
//
//  Created by Nader Neyzi on 2/10/18.
//

import Foundation

/*
 Given an array of N integers, find the pair of integers in the array which have minimum XOR value. Report the minimum XOR value.

 Examples :
 Input
 0 2 5 7
 Output
 2 (0 XOR 2)
 Input
 0 4 7 9
 Output
 3 (4 XOR 7)

 Constraints:
 2 <= N <= 100 000
 0 <= A[i] <= 1 000 000 000
*/

func findMinXor(_ A: inout [Int]) -> Int {

    A.sort()
    var minNum = Int.max
    var val = 0
    var i = 0
    while i < (A.count - 1) {
        val = A[i] ^ A[i+1]
        minNum = min(minNum, val)
        i += 1
    }

    return minNum
}
