//
//  Preorder Traversal.swift
//  
//
//  Created by Nader Neyzi on 1/30/18.
//

import Foundation

/*
 Given a binary tree, return the preorder traversal of its nodes’ values.

 Example :
 Given binary tree

 1
 \
 2
 /
 3
 return [1,2,3].

 Using recursion is not allowed.
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
    func preorderTraversal(_ A: TreeNode?) -> [Int] {
        if A == nil { return [] }

        var ans:[Int] = []
        var stack:[TreeNode] = [A!]

        while !stack.isEmpty {
            var currentNode = stack.last!

            ans.append(currentNode.val)
            stack.removeLast()

            if currentNode.right != nil { stack.append(currentNode.right!) }
            if currentNode.left != nil { stack.append(currentNode.left!) }
        }

        return ans
    }
}
