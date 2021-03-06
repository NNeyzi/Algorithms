//
//  Identical Binary Trees.swift
//  
//
//  Created by Nader Neyzi on 2/4/18.
//

import Foundation

/*
 Given two binary trees, write a function to check if they are equal or not.

 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.

 Return 0 / 1 ( 0 for false, 1 for true ) for this problem

 Example :

 Input :

 1       1
 / \     / \
 2   3   2   3

 Output :
 1 or True
*/

/**
 * Definition for a binary tree node
 *
 * class TreeNode {
 *    var val: Int = 0
 *    var left: TreeNode?
 *    var right: TreeNode?
 * }
 *
 */

class Solution {
    func isSameTree(_ A: TreeNode?, _ B: TreeNode?) -> Int {

        if A == nil && B == nil { return 1 }

        if A != nil && B != nil {
            if A!.val == B!.val && isSameTree(A!.left, B!.left) == 1 && isSameTree(A!.right, B!.right) == 1 {
                return 1
            } else {
                return 0
            }
        }

        return 0
    }
}
