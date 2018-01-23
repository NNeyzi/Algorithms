//
//  Kth Row of Pascal's Triangle.swift
//  
//
//  Created by Nader Neyzi on 1/22/18.
//

import Foundation

/*
 Given an index k, return the kth row of the Pascal’s triangle.

 Pascal’s triangle : To generate A[C] in row R, sum up A’[C] and A’[C-1] from previous row R - 1.

 Example:

 Input : k = 3

 Return : [1,3,3,1]
 NOTE : k is 0 based. k = 0, corresponds to the row [1].
 Note:Could you optimize your algorithm to use only O(k) extra space?
 */

func getRow(_ A: inout Int) -> [Int] {
    if A == 0 { return [1] }
    if A == 1 { return [1, 1] }
    if A == 2 { return [1, 2, 1] }

    var answer = [1, 2, 1]
    for i in 3...A {
        var j = 1
        var prev = 1
        while j < i {
            var hold = answer[j]
            if j != (i - 1) { answer.remove(at:j) }
            var newVal = prev + hold
            answer.insert(newVal, at: j)
            prev = hold
            j += 1
        }
    }

    return answer
}
