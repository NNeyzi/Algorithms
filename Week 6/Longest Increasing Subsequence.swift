//
//  Longest Increasing Subsequence.swift
//  
//
//  Created by Nader Neyzi on 2/28/18.
//

import Foundation

/*
 Find the longest increasing subsequence of a given sequence / array.

 In other words, find a subsequence of array in which the subsequence’s elements are in strictly increasing order, and in which the subsequence is as long as possible.
 This subsequence is not necessarily contiguous, or unique.
 In this case, we only care about the length of the longest increasing subsequence.

 Example :

 Input : [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
 Output : 6
 The sequence : [0, 2, 6, 9, 13, 15] or [0, 4, 6, 9, 11, 15] or [0, 4, 6, 9, 13, 15]
 */

func lis(_ A: [Int]) -> Int {
    if A.count == 1 { return 1 }
    var pathLengths:[Int] = []
    for i in 0..<A.count {
        pathLengths.append(1)
    }

    var longestPath = 1

    for i in (0...(A.count-2)).reversed() {
        var currentMaxP = Int.min
        for j in (i+1)..<A.count {
            if A[i] < A[j] {
                currentMaxP = max(currentMaxP, pathLengths[j])
            }
        }
        if currentMaxP != Int.min { pathLengths[i] = currentMaxP + 1 }
        longestPath = max(longestPath, pathLengths[i])
    }

    return longestPath
}
