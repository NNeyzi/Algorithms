//
//  Length of Last Word.swift
//  
//
//  Created by Nader Neyzi on 1/18/18.
//

import Foundation

/*
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

 If the last word does not exist, return 0.

 Note: A word is defined as a character sequence consists of non-space characters only.

 Example:

 Given s = "Hello World",

 return 5 as length("World") = 5.

 Please make sure you try to solve this problem without using library functions. Make sure you only traverse the string once.
*/


func lengthOfLastWord(_ A: String) -> Int {
    var len = 0

    for i in 0..<A.count {
        var charStr = A[A.index(A.endIndex, offsetBy: -i-1)]

        if charStr == " " && len != 0 { break }

        if charStr != " " {
            len += 1
        }
    }

    return len
}
