//
//  Jump Game Array.swift
//  
//
//  Created by Nader Neyzi on 3/1/18.
//

import Foundation

/*
 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Determine if you are able to reach the last index.

 For example:
 A = [2,3,1,1,4], return 1 ( true ).

 A = [3,2,1,0,4], return 0 ( false ).

 Return 0/1 for this problem
*/

func canJump(_ A: inout [Int]) -> Int {
    if A.count < 2 { return 1 }

    var need = 1
    var i = A.count - 2
    while i >= 0 {
        if A[i] < need {
            need += 1
        } else {
            if i == 0 { return 1 }
            need = 1
        }

        i -= 1
    }

    return 0
}
