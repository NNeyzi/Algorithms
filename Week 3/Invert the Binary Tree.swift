//
//  Invert the Binary Tree.swift
//  
//
//  Created by Nader Neyzi on 2/4/18.
//

import Foundation

/*
 Given a binary tree, invert the binary tree and return it.
 Look at the example for more details.

 Example :
 Given binary tree

 1
 /   \
 2     3
 / \   / \
 4   5 6   7
 invert and return

 1
 /   \
 3     2
 / \   / \
 7   6 5   4
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
    func invertTree(_ A: TreeNode?) -> TreeNode? {
        if A == nil { return nil }

        var hold = invertTree(A!.left)
        A!.left = invertTree(A!.right)
        A!.right = hold

        return A
    }
}
