//
//  Palindrome String.swift
//  
//
//  Created by Nader Neyzi on 1/18/18.
//

import Foundation

/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Example:

 "A man, a plan, a canal: Panama" is a palindrome.

 "race a car" is not a palindrome.

 Return 0 / 1 ( 0 for false, 1 for true ) for this problem
*/


func isPalindrome(_ A: inout String) -> Int {
    if A.count == 0 { return 1 }
    if A.count == 1 { return 1 }
    var chars = Array(A.lowercased().characters)
    var i = 0
    while i < chars.count {
        if String(chars[i]).rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
            chars.remove(at: i)
        } else {
            i += 1
        }
    }

    if chars.count == 0 { return 1 }
    if chars.count == 1 { return 1 }

    var ans = 1

    i = 0
    while i < (chars.count / 2) {
        if chars[i] != chars[chars.count-1-i] { return 0 }
        i += 1
    }


    return ans
}
