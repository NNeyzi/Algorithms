//
//  Combinations.swift
//  
//
//  Created by Nader Neyzi on 2/10/18.
//

import Foundation

/*
 Given two integers n and k, return all possible combinations of k numbers out of 1 2 3 ... n.

 Make sure the combinations are sorted.

 To elaborate,

 Within every entry, elements should be sorted. [1, 4] is a valid entry while [4, 1] is not.
 Entries should be sorted within themselves.
 Example :
 If n = 4 and k = 2, a solution is:

 [
 [1,2],
 [1,3],
 [1,4],
 [2,3],
 [2,4],
 [3,4],
 ]
 Warning : DO NOT USE LIBRARY FUNCTION FOR GENERATING COMBINATIONS.
 Example : itertools.combinations in python.
 If you do, we will disqualify your submission retroactively and give you penalty points.
*/

func combine(_ A: inout Int, _ B: inout Int) -> [[Int]] {
    if B > A { return [] }
    var ans:[[Int]] = []
    var comb:[Int] = []
    var arr:[Int] = []
    for i in 1...A {
        arr.append(i)
    }
    recurse(arr, &comb, 0, B, &ans)
    return ans
}

func recurse(_ arr: [Int], _ comb: inout [Int], _ l: Int, _ len: Int, _ total: inout [[Int]]) {
    if comb.count == len {
        total.append(comb)
        return
    }

    for i in l..<arr.count {
        comb.append(arr[i])
        recurse(arr, &comb, i+1, len, &total)
        comb.removeLast()
    }
}
