//
//  Max Depth of Binary Tree.swift
//  
//
//  Created by Nader Neyzi on 1/30/18.
//

import Foundation

/*
 Given a binary tree, find its maximum depth.

 The maximum depth of a binary tree is the number of nodes along the longest path from the root node down to the farthest leaf node.

 NOTE : The path has to end on a leaf node.
 Example :

 1
 /
 2
 max depth = 2.
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
    func maxDepth(_ A: TreeNode?) -> Int {
        if A == nil { return 0 }

        var lDepth = maxDepth(A!.left) + 1
        var rDepth = maxDepth(A!.right) + 1

        if lDepth > rDepth {
            return lDepth
        } else {
            return rDepth
        }
    }
}


