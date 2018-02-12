//
//  Single Number II.swift
//  
//
//  Created by Nader Neyzi on 2/11/18.
//

import Foundation

/*
 Given an array of integers, every element appears thrice except for one which occurs once.

 Find that element which does not appear thrice.

 Note: Your algorithm should have a linear runtime complexity.

 Could you implement it without using extra memory?

 Example :

 Input : [1, 2, 4, 3, 3, 2, 2, 3, 1, 1]
 Output : 4
*/

func singleNumber(_ A: [Int]) -> Int {
    if A.count < 1 { return 0 }
    var ones = 0
    var twos = 0
    var commonBitMask = 0

    for num in A {
        twos = twos | (ones & num)
        ones = ones ^ num
        commonBitMask = ~(ones & twos)
        ones = ones & commonBitMask
        twos = twos & commonBitMask
    }

    return ones
}
