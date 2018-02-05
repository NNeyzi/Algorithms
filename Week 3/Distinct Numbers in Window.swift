//
//  Distinct Numbers in Window.swift
//  
//
//  Created by Nader Neyzi on 2/4/18.
//

import Foundation

/*
 You are given an array of N integers, A1, A2 ,…, AN and an integer K. Return the of count of distinct numbers in all windows of size K.

 Formally, return an array of size N-K+1 where i’th element in this array contains number of distinct elements in sequence Ai, Ai+1 ,…, Ai+k-1.

 Note:

 If K > N, return empty array.
 For example,

 A=[1, 2, 1, 3, 4, 3] and K = 3

 All windows of size K are

 [1, 2, 1]
 [2, 1, 3]
 [1, 3, 4]
 [3, 4, 3]

 So, we return an array [2, 3, 3, 2].
*/

func dNums(_ A: inout [Int], _ B: inout Int) -> [Int] {

    var dict:[Int:Int] = [:]
    var count = 0
    var ans:[Int] = []
    var i = 0

    while i < A.count {

        var num = A[i]

        if dict[num] == nil {
            dict[num] = 1
            count += 1
        } else {
            dict[num] = dict[num]! + 1
        }

        if (i - B) >= 0 {
            var prev = A[i-B]

            dict[prev] = dict[prev]! - 1

            if dict[prev]! == 0 {
                dict.removeValue(forKey: prev)
                count -= 1
            }
        }

        if (i + 1) >= B { ans.append(count) }

        i += 1
    }

    return ans
}
