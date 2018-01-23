//
//  NEXTGREATER.swift
//  
//
//  Created by Nader Neyzi on 1/12/18.
//

import Foundation

/*
 Given an array, find the next greater element G[i] for every element A[i] in the array. The Next greater Element for an element A[i] is the first greater element on the right side of A[i] in array.
 More formally,

 G[i] for an element A[i] = an element A[j] such that
 j is minimum possible AND
 j > i AND
 A[j] > A[i]
 Elements for which no greater element exist, consider next greater element as -1.

 Example:

 Input : A : [4, 5, 2, 10]
 Output : [5, 10, 10, -1]

 Example 2:

 Input : A : [3, 2, 1]
 Output : [-1, -1, -1]
 */

func nextGreater(_ A: inout [Int]) -> [Int] {
    if A.count == 1 { return [-1] }

    var result:[Int] = []
    var stack:[Int] = []

    var i = A.count - 1
    while i > -1 {
        if stack.count == 0 {
            result.insert(-1, at: 0)
            stack.append(A[i])
            i -= 1
        } else if A[i] >= stack.last! {
            stack.removeLast()
        } else if A[i] < stack.last! {
            result.insert(stack.last!, at: 0)
            stack.append(A[i])
            i -= 1
        }
    }

    return result
}

// <3 stacks
