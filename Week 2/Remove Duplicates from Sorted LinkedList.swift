//
//  Remove Duplicates from Sorted LinkedList.swift
//  
//
//  Created by Nader Neyzi on 1/29/18.
//

import Foundation

/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.

 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
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
    func deleteDuplicates(_ A: ListNode?) -> ListNode? {
        if A == nil { return nil }
        if A!.next == nil { return nil }

        var current = A
        while current != nil {
            if current!.next != nil && current!.val == current!.next!.val {
                //remove next
                current!.next = current!.next!.next
                continue
            }
            current = current!.next
        }

        return A
    }
}
