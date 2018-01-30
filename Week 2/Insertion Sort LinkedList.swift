//
//  Insertion Sort LinkedList.swift
//  
//
//  Created by Nader Neyzi on 1/29/18.
//

import Foundation

/*
 Sort a linked list using insertion sort.

 We have explained Insertion Sort at Slide 7 of Arrays

 Insertion Sort Wiki has some details on Insertion Sort as well.

 Example :

 Input : 1 -> 3 -> 2

 Return 1 -> 2 -> 3
*/

/**
 * Definition for a linked list node
 *
 * class ListNode {
 *    var val: Int = 0
 *    var next: ListNode?
 * }
 *
 */

class Solution {
    func insertionSortList(_ A: ListNode?) -> ListNode? {
        if A == nil { return A }
        if A?.next == nil { return A }

        var head = A
        var prev = A
        var current = A?.next
        var sortedCount = 1
        while current != nil {
            var nextPrev:ListNode? = current!
            let nextCurrent = current!.next

            var sortedPrev:ListNode? = nil
            var sortedCurrent = head
            for _ in 1...sortedCount {
                if current!.val <= sortedCurrent!.val {
                    prev!.next = current!.next
                    current!.next = sortedCurrent

                    if sortedPrev == nil {
                        head = current
                    } else {
                        sortedPrev!.next = current
                    }

                    nextPrev = prev
                    break
                }
                sortedPrev = sortedCurrent
                sortedCurrent = sortedCurrent!.next
            }

            sortedCount += 1
            prev = nextPrev
            current = nextCurrent
        }

        return head
    }
}
