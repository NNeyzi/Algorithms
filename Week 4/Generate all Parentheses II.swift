//
//  Generate all Parentheses II.swift
//  
//
//  Created by Nader Neyzi on 2/11/18.
//

import Foundation

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses of length 2*n.

 For example, given n = 3, a solution set is:

 "((()))", "(()())", "(())()", "()(())", "()()()"
 Make sure the returned list of strings are sorted.
*/

func generateParenthesis(_ A: inout Int) -> [String] {
    var total:[String] = []
    addParen("", 0, 0, A, &total)
    return total
}

func addParen(_ str: String, _ open: Int, _ closed: Int, _ limit: Int, _ total: inout [String]) {
    if (open + closed) == (limit * 2) {
        total.append(str)
        return
    }

    if open < limit {
        addParen(str+"(", open+1, closed, limit, &total)
    }
    if closed < open {
        addParen(str+")", open, closed+1, limit, &total)
    }
}
