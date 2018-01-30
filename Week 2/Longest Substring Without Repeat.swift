//
//  Longest Substring Without Repeat.swift
//  
//
//  Created by Nader Neyzi on 1/29/18.
//

import Foundation

/*
 Given a string,
 find the length of the longest substring without repeating characters.

 Example:

 The longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3.

 For "bbbbb" the longest substring is "b", with the length of 1.
*/

func lengthOfLongestSubstring(_ A: inout String) -> Int {

    var stringArray = Array(A)
    var lastIndexes:[String:Int] = [:]
    var count = 0
    var maxCount = 0

    for i in 0..<stringArray.count {
        var str = String(stringArray[i])

        if lastIndexes[str] == nil || (i - count) > lastIndexes[str]! {
            count += 1
        } else {
            maxCount = max(maxCount, count)
            count = i - lastIndexes[str]!
        }

        lastIndexes[str] = i
    }

    maxCount = max(maxCount, count)

    return maxCount
}
