//
//  NUMRANGE.swift
//  
//
//  Created by Nader Neyzi on 1/12/18.
//

import Foundation

/*
 Given an array of non negative integers A, and a range (B, C),
 find the number of continuous subsequences in the array which have sum S in the range [B, C] or B <= S <= C

 Continuous subsequence is defined as all the numbers A[i], A[i + 1], .... A[j]
 where 0 <= i <= j < size(A)

 Example :

 A : [10, 5, 1, 0, 2]
 (B, C) : (6, 8)
 ans = 3
 as [5, 1], [5, 1, 0], [5, 1, 0, 2] are the only 3 continuous subsequence with their sum in the range [6, 8]
*/

func numRange(_ A: inout [Int], _ B: inout Int, _ C: inout Int) -> Int {
    if A.count == 0 || B > C { return 0 }

    var count = 0

    for s in 0..<A.count {
        var sum = 0

        for e in s..<A.count {
            sum += A[e]
            if sum >= B && sum <= C {
                count += 1
            }

            if sum > C {
                break;
            }
        }
    }

    return count
}
