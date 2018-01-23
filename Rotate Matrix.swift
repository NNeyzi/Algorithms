//
//  Rotate Matrix.swift
//  
//
//  Created by Nader Neyzi on 1/20/18.
//

import Foundation

/*
 You are given an n x n 2D matrix representing an image.

 Rotate the image by 90 degrees (clockwise).

 You need to do this in place.

 Note that if you end up using an additional array, you will only receive partial score.

 Example:

 If the array is

 [
 [1, 2],
 [3, 4]
 ]
 Then the rotated array becomes:

 [
 [3, 1],
 [4, 2]
 ]
*/

func rotateMatrix(matrix: inout [[Int]]) -> [[Int]] {
    let numOfLayers = ((matrix.count - (matrix.count % 2)) / 2)
    for layerIndex in 0..<numOfLayers {
        var hold = matrix[layerIndex][layerIndex]

        var i = layerIndex
        var j = layerIndex + 1

        let minI = layerIndex
        let minJ = layerIndex

        let maxI = (matrix.count - 1) - layerIndex
        let maxJ = (matrix.count - 1) - layerIndex

        var temp: Int

        //topToRight
        while (j <= maxJ) {
            temp = matrix[i][j]
            matrix[i][j] = hold
            hold = temp
            j += 1
        }

        j -= 1
        i += 1

        //rightToBot
        while (i <= maxI) {
            temp = matrix[i][j]
            matrix[i][j] = hold
            hold = temp
            i += 1
        }

        i -= 1
        j -= 1

        //botToLeft
        while (j >= minJ) {
            temp = matrix[i][j]
            matrix[i][j] = hold
            hold = temp
            j -= 1
        }

        j += 1
        i -= 1

        //        leftToTop
        while (i >= minI) {
            temp = matrix[i][j]
            matrix[i][j] = hold
            hold = temp
            i -= 1
        }
    }

    return matrix
}
