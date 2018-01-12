//
//  PRETTYPRINT.swift
//  
//
//  Created by Nader Neyzi on 1/12/18.
//

import Foundation

/*

Print concentric rectangular pattern in a 2d matrix.

Input: A = 4.
Output:

4 4 4 4 4 4 4
4 3 3 3 3 3 4
4 3 2 2 2 3 4
4 3 2 1 2 3 4
4 3 2 2 2 3 4
4 3 3 3 3 3 4
4 4 4 4 4 4 4
 */

func prettyPrint(_ num: Int) -> [[Int]] {
    var matrix = [[1]]
    if num == 1 { return matrix }

    for i in 2...num {
        matrix = helper(i, matrix)
    }

    return matrix
}

func helper(_ num: Int, _ matrix: [[Int]]) -> [[Int]] {
    var newMatrix = matrix

    for i in 0..<matrix.count {
        var subArr = newMatrix[i]

        subArr.insert(num, at: 0)
        subArr.append(num)

        newMatrix[i] = subArr
    }

    var newLen = (num*2) - 1
    var arr: [Int] = []
    for i in 0..<newLen {
        arr.append(num)
    }

    newMatrix.insert(arr, at: 0)
    newMatrix.append(arr)

    return newMatrix
}
