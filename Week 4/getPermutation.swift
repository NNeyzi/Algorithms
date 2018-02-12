//
//  getPermutation.swift
//  
//
//  Created by Nader Neyzi on 2/11/18.
//

import Foundation

/*
 The set [1,2,3,…,n] contains a total of n! unique permutations.

 By listing and labeling all of the permutations in order,
 We get the following sequence (ie, for n = 3 ) :

 1. "123"
 2. "132"
 3. "213"
 4. "231"
 5. "312"
 6. "321"
 Given n and k, return the kth permutation sequence.

 For example, given n = 3, k = 4, ans = "231"

 Good questions to ask the interviewer :
 What if n is greater than 10. How should multiple digit numbers be represented in string?
 In this case, just concatenate the number to the answer.
 so if n = 11, k = 1, ans = "1234567891011"
 Whats the maximum value of n and k?
 In this case, k will be a positive integer thats less than INT_MAX.
 n is reasonable enough to make sure the answer does not bloat up a lot.
*/

func getPermutation(_ A: inout Int, _ B: inout Int) -> String {
    if A <= 0 { return "" }
    var fact: Int = 1
    for i in 1...A{
        fact = fact * i
    }

    if B > fact { return "" }

    var nums:[Int] = []
    for i in 1...A {
        nums.append(i)
    }

    B -= 1

    var mod = 1
    for i in 1...A {
        mod *= i
    }

    var result = ""
    for i in 0..<A {
        mod = mod / (A - i)

        var currentIndex = 0
        if B != 0 {
            currentIndex = B / mod
        }

        if mod != 0 {
            B = B % mod
        }

        result = result + String(nums[currentIndex])
        nums.remove(at: currentIndex)

    }

    return result
}
