//
//  Longest Consecutive Sequence.swift
//  
//
//  Created by Nader Neyzi on 1/12/18.
//

import Foundation

/*
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

 Example:
 Given [100, 4, 200, 1, 3, 2],
 The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.

 Your algorithm should run in O(n) complexity.
*/

func longestConsecutive(_ A: [Int]) -> Int {
    if A.count == 0 { return 0 }


    var set = Set<Int>()
    for i in 0..<A.count {
        set.insert(A[i])
    }

    var highestCount = 0

    for num in set {
        if !set.contains(num-1) {
            var currentNum = num
            var currentCount = 1

            while set.contains(currentNum+1) {
                currentNum += 1
                currentCount += 1
            }

            highestCount = max(highestCount, currentCount)
        }
    }

    return highestCount
}
