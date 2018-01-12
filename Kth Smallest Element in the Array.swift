//
//  Kth Smallest Element in the Array.swift
//  
//
//  Created by Nader Neyzi on 1/12/18.
//

import Foundation

/*
 Find the kth smallest element in an unsorted array of non-negative integers.

 Definition of kth smallest element

 kth smallest element is the minimum possible n such that there are at least k elements in the array <= n.
 In other words, if the array A was sorted, then A[k - 1] ( k is 1 based, while the arrays are 0 based )
 NOTE
 You are not allowed to modify the array ( The array is read only ).
 Try to do it using constant extra space.

 Example:

 A : [2 1 4 3 2]
 k : 3

 answer : 2
 */

func kthsmallest(_ A: [Int], _ B: inout Int) -> Int {
    let k = B

    var smallest = A[0]
    for i in 1..<A.count {
        if smallest > A[i] {
            smallest = A[i]
        }
    }

    var count = 1
    while count < k {
        var nextSmallest = 9999999
        var dupes = -1
        for i in 0..<A.count {

            if smallest == A[i] {
                dupes += 1
                if dupes > 0 {
                    if (count + dupes) == k {
                        return A[i]
                    }
                }
            }

            if (A[i] > smallest && A[i] < nextSmallest) {
                nextSmallest = A[i]
            }
        }

        smallest = nextSmallest

        count += dupes
        count += 1
    }

    return smallest
}

// Not time efficient
