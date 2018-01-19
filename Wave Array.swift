//
//  Wave Array.swift
//  
//
//  Created by Nader Neyzi on 1/18/18.
//

import Foundation

/*
 Given an array of integers, sort the array into a wave like array and return it,
 In other words, arrange the elements into a sequence such that a1 >= a2 <= a3 >= a4 <= a5.....

 Example

 Given [1, 2, 3, 4]

 One possible answer : [2, 1, 4, 3]
 Another possible answer : [4, 1, 3, 2]
*/

func wave(_ A: inout [Int]) -> [Int] {
    if A.count == 1 || A.count == 0 { return A }

    A = A.sorted()
    var B:[Int] = []

    var i = 0
    while i < A.count {
        if (i+1) < A.count { B.append(A[i+1]) }
        B.append(A[i])
        i += 2
    }

    return B
}
