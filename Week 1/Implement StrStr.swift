//
//  Implement StrStr.swift
//  
//
//  Created by Nader Neyzi on 1/22/18.
//

import Foundation
/*
 Implement strStr().

 strstr - locate a substring ( needle ) in a string ( haystack ).
 Try not to use standard library string functions for this question.

 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 NOTE: Good clarification questions:
 What should be the return value if the needle is empty?
 What if both haystack and needle are empty?
 For the purpose of this problem, assume that the return value should be -1 in both cases.
 */

func strStr(_ A: String, _ B: String) -> Int {
    var answer = -1

    var haystack = Array(A)
    var needle = Array(B)

    var i = 0
    while i < haystack.count {
        var hold = i
        var j = 0
        while j < needle.count && i < haystack.count && haystack[i] == needle[j] {
            if needle[j] == haystack[i] {
                if j == (needle.count - 1){
                    return i - j
                }
                i += 1
                j += 1
            } else {
                break
            }
        }

        i = hold + 1
    }

    return answer
}
