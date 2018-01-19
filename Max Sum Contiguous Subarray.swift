//
//  Max Sum Contiguous Subarray.swift
//  
//
//  Created by Nader Neyzi on 1/18/18.
//

import Foundation

/*
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

 For example:

 Given the array [-2,1,-3,4,-1,2,1,-5,4],

 the contiguous subarray [4,-1,2,1] has the largest sum = 6.

 For this problem, return the maximum sum.
*/

func maxSubArray(_ A: [Int]) -> Int {
    var maxNum = A[0]
    for i in 0..<A.count {
        maxNum = max(maxNum, A[i])
    }
    if maxNum < 0 { return maxNum }

    var currentS = 0
    var maxS = 0
    for i in 0..<A.count {
        currentS += A[i]
        if currentS < 0 {
            currentS = 0
        }
        maxS = max(currentS, maxS)
    }
    return maxS
}
