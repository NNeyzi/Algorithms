//
//  Add Two Numbers as Lists.swift
//  
//
//  Created by Nader Neyzi on 1/25/18.
//

import Foundation

/*
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8

 342 + 465 = 807
 Make sure there are no trailing zeros in the output list
 So, 7 -> 0 -> 8 -> 0 is not a valid response even though the value is still 807.
*/

func addTwoNumbers(_ A: ListNode?, _ B: ListNode?) -> ListNode? {

    var ans = ListNode()
    var head = ans
    var rest = 0

    var A = A
    var B = B

    while (A != nil || B != nil) {
        print("A val = \(A?.val)")
        print("B val = \(B?.val)")
        head.val = (A?.val ?? 0) + (B?.val ?? 0) + rest
        rest = 0

        if head.val >= 10 {
            rest = head.val / 10
            head.val = head.val % 10
        }

        var next = ListNode()
        head.next = next
        head = next

        A = A?.next
        B = B?.next
    }

    return ans

}
