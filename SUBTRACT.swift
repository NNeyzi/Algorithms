//
//  SUBTRACT.swift
//  
//
//  Created by Nader Neyzi on 1/12/18.
//

import Foundation

/*
 Given a singly linked list, modify the value of first half nodes such that :

 1st node’s new value = the last node’s value - first node’s current value
 2nd node’s new value = the second last node’s value - 2nd node’s current value,
 and so on …

 NOTE :
 If the length L of linked list is odd, then the first half implies at first floor(L/2) nodes. So, if L = 5, the first half refers to first 2 nodes.
 If the length L of linked list is even, then the first half implies at first L/2 nodes. So, if L = 4, the first half refers to first 2 nodes.
 Example :

 Given linked list 1 -> 2 -> 3 -> 4 -> 5,

 You should return 4 -> 2 -> 3 -> 4 -> 5
 as

 for first node, 5 - 1 = 4
 for second node, 4 - 2 = 2
 Try to solve the problem using constant extra space.
*/

func subtract(_ A: ListNode?) -> ListNode? {

    var length = 0
    var tempNode = A
    while tempNode != nil {
        length += 1
        tempNode = tempNode?.next
    }

    if length == 1 { return A }

    var startNode = A
    var halfLength = Int(floor(Double(length / 2)))
    for i in 1...halfLength {
        var endNode = startNode
        var oppositePos = (2 * (halfLength - i)) + 1
        if i == 1 { oppositePos = (length - 1) }
        for j in 1...oppositePos {
            endNode = endNode!.next
        }

        startNode!.val = endNode!.val - startNode!.val
        startNode = startNode!.next
    }

    return A
}

// Solution works
// Interviewbit has a bug in this question for Swift
// As stated in the comments
