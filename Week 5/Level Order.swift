//
//  Level Order.swift
//  
//
//  Created by Nader Neyzi on 2/18/18.
//

import Foundation

/*
 Given a binary tree, return the level order traversal of its nodes’ values. (ie, from left to right, level by level).

 Example :
 Given binary tree

 3
 / \
 9  20
 /  \
 15   7
 return its level order traversal as:

 [
 [3],
 [9,20],
 [15,7]
 ]
 Also think about a version of the question where you are asked to do a level order traversal of the tree when depth of the tree is much greater than number of nodes on a level.
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
    func levelOrder(_ A: TreeNode?) -> [[Int]] {
        if A == nil { return [] }
        var ans:[[Int]] = []
        var queue:[TreeNode] = [A!]
        var current = A!

        while queue.count > 0 {
            var levelCount = queue.count

            var subAns:[Int] = []

            while levelCount > 0 {
                current = queue.removeLast()
                if current.left != nil { queue.insert(current.left!, at:0) }
                if current.right != nil { queue.insert(current.right!, at:0) }

                subAns.append(current.val)
                levelCount -= 1
            }

            ans.append(subAns)
        }

        return ans
    }
}

