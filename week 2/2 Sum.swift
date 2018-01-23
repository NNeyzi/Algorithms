//
//  2 Sum.swift
//  
//
//  Created by Nader Neyzi on 1/23/18.
//

import Foundation

/*
 Given an array of integers, find two numbers such that they add up to a specific target number.

 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 < index2. Please note that your returned answers (both index1 and index2 ) are not zero-based.
 Put both these numbers in order in an array and return the array from your function ( Looking at the function signature will make things clearer ). Note that, if no pair exists, return empty list.

 If multiple solutions exist, output the one where index2 is minimum. If there are multiple solutions with the minimum index2, choose the one with minimum index1 out of them.

 Input: [2, 7, 11, 15], target=9
 Output: index1 = 1, index2 = 2
*/

func twoSum(_ A: [Int], _ B: inout Int) -> [Int] {
    var dict:[Int: Int] = [:]
    var answer:[Int] = []
    for i in 0..<A.count {
        if dict[A[i]] != nil {
            answer.append(dict[A[i]]! + 1)
            answer.append(i + 1)
            break
        } else {
            var needed = B - A[i]
            if dict[needed] == nil {
                dict[needed] = i
            }
        }
    }


    return answer
}
