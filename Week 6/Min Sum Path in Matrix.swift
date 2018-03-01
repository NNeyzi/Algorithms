//
//  Min Sum Path in Matrix.swift
//  
//
//  Created by Nader Neyzi on 2/28/18.
//

import Foundation

/*
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.
 Example :

 Input :

 [  1 3 2
 4 3 1
 5 6 1
 ]

 Output : 8
 1 -> 3 -> 2 -> 1 -> 1
 */

func minPathSum(_ A: inout [[Int]]) -> Int {
    if A.count == 0 { return -1 }
    var m = A.count - 1
    var n = A[0].count - 1
    var memo:[Int:[Int:Int]] = [:]
    return minPathSumRecurse(&A, m, n, &memo)
}

func minPathSumRecurse(_ A: inout [[Int]], _ m: Int, _ n: Int, _ memo: inout [Int:[Int:Int]]) -> Int {
    if m < 0 || n < 0 { return Int.max }
    if m == 0 && n == 0 { return A[m][n] }
    if memo[m] != nil && memo[m]![n] != nil { return memo[m]![n]! }
    if memo[m] == nil { memo[m] = [:] }
    memo[m]![n] = A[m][n] + min(minPathSumRecurse(&A, m-1, n, &memo), minPathSumRecurse(&A, m, n-1, &memo))
    return memo[m]![n]!
}

