//
//  Unique Binary Search Trees II.swift
//  
//
//  Created by Nader Neyzi on 3/1/18.
//

import Foundation

/*
 Given A, how many structurally unique BST’s (binary search trees) that store values 1...A?

 Example :

 Given A = 3, there are a total of 5 unique BST’s.


 1         3     3      2      1
 \       /     /      / \      \
 3     2     1      1   3      2
 /     /       \                 \
 2     1         2                 3
*/

func numTrees(_ A: inout Int) -> Int {
    var numBST:[Int:Int] = [0:1]

    for i in 1...A {
        for j in 0..<i {
            if numBST[i] == nil {
                numBST[i] = numBST[j]! * numBST[i-1-j]!
            } else {
                numBST[i] = numBST[i]! + (numBST[j]! * numBST[i-1-j]!)
            }
        }
    }

    return numBST[A]!
}
