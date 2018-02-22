//
//  Convert Sorted List to Binary Search Tree.swift
//  
//
//  Created by Nader Neyzi on 2/22/18.
//

import Foundation

/*
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 A height balanced BST : a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 Example :


 Given A : 1 -> 2 -> 3
 A height balanced BST  :

 2
 /   \
 1     3
*/

class TreeNode {
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?

    init() {
        val = 0
        left = nil
        right = nil
    }
}
class ListNode {
    var val:Int
    var next:ListNode?

    init() {
        val = 0
        next = nil
    }
}

func sortedListToBST(listNode: ListNode) -> TreeNode? {
    var count = countList(listNode)

    var head = listNode
    return recurseListToBST(count, &head)
}

func recurseListToBST(_ n: Int, _ head: inout ListNode) -> TreeNode? {
    if n == 0 { return nil }

    var left = recurseListToBST(n / 2, &head)

    var root = TreeNode()
    root.val = head.val
    root.left = left

    head = head.next!

    let newN = n - (n / 2) - 1
    root.right = recurseListToBST(newN, &head)

    return root
}

func countList(_ listNode: ListNode) -> Int {
    var count = 0
    var current:ListNode? = listNode

    while current != nil {
        count += 1
        current = current!.next
    }

    return count
}
