//
//  Single Number.swift
//  
//
//  Created by Nader Neyzi on 2/10/18.
//

import Foundation

/*
 Given an array of integers, every element appears twice except for one. Find that single one.

 Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example :

 Input : [1 2 2 3 1]
 Output : 3
*/

func singleNumber(_ A: [Int]) -> Int {
    if A.count < 1 { return 0 }
    var total = A[0]
    var i = 1
    while i < A.count {
        total = total ^ A[i]
        i += 1
    }

    return total
}
