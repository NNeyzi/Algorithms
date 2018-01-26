//
//  reverseBetween LinkedList.swift
//  
//
//  Created by Nader Neyzi on 1/25/18.
//

import Foundation

/*
 Reverse a linked list from position m to n. Do it in-place and in one-pass.

 For example:
 Given 1->2->3->4->5->NULL, m = 2 and n = 4,

 return 1->4->3->2->5->NULL.

 Note:
 Given m, n satisfy the following condition:
 1 ≤ m ≤ n ≤ length of list. Note 2:
 Usually the version often seen in the interviews is reversing the whole linked list which is obviously an easier version of this question.
*/

func reverseBetween(_ A: ListNode?, _ B: inout Int, _ C: inout Int) -> ListNode? {
    if B == C { return A }

    var pB = A!
    var b = A!
    var aB = A!

    var current = A!.next
    var prev = A!

    if B == 2 {
        pB = A!
    }

    for i in 2...C {
        if current == nil { return nil }

        if i == (B-1) {
            pB = current!
        }
        if i == B {
            b = current!
        }
        if i > B && i < C {
            if i == (B+1) { aB = current! }
            let hold = current!.next
            current!.next = prev
            prev = current!
            current = hold!
            continue
        }
        if i == C {
            pB.next = current!
            b.next = current!.next
            current!.next = aB
            continue
        }

        prev = current!
        current = current!.next
    }

    return A
}
