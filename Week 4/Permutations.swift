//
//  Permutations.swift
//  
//
//  Created by Nader Neyzi on 2/10/18.
//

import Foundation

/*
 Given a collection of numbers, return all possible permutations.

 Example:

 [1,2,3] will have the following permutations:

 [1,2,3]
 [1,3,2]
 [2,1,3]
 [2,3,1]
 [3,1,2]
 [3,2,1]
 NOTE
 No two entries in the permutation sequence should be the same.
 For the purpose of this problem, assume that all the numbers in the collection are unique.
 Warning : DO NOT USE LIBRARY FUNCTION FOR GENERATING PERMUTATIONS.
*/

func permute(_ A: inout [Int]) -> [[Int]] {
    var ans:[[Int]] = []
    recurse(&A, 0, (A.count-1), &ans)
    return ans
}

func recurse(_ arr: inout [Int], _ l: Int, _ r: Int, _ total: inout [[Int]]) {
    if l == r { return total.append(arr) }

    for i in l...r {
        arr.swapAt(l, i)
        recurse(&arr, l+1, r, &total)
        arr.swapAt(l,i)
    }

}

