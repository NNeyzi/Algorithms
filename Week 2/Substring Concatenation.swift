//
//  Substring Concatenation.swift
//  
//
//  Created by Nader Neyzi on 1/29/18.
//

import Foundation

/*
 You are given a string, S, and a list of words, L, that are all of the same length.

 Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.

 Example :

 S: "barfoothefoobarman"
 L: ["foo", "bar"]
 You should return the indices: [0,9].
 (order does not matter).
*/

func findSubstring(_ A: inout String, _ B: [String]) -> [Int] {
    if B.count == 0 || A == "" { return [] }

    let wordLen = B[0].count
    var total = Array(A)
    var used:[String:Int] = [:]
    var words:[String:Int] = [:]
    for word in B {
        if words[word] == nil {
            words[word] = 1
            used[word] = 0
        } else {
            words[word] = words[word]! + 1
        }
    }

    var matchStart = -1
    var answer:[Int] = []
    var i = 0
    while i <= (total.count - wordLen) {
        var subWord = ""
        let subCount = i
        for j in subCount..<(subCount + wordLen) {
            let letter = String(total[j])
            subWord = subWord + letter
        }

        if used[subWord] != nil && (used[subWord]! + 1) <= words[subWord]! {
            if matchStart == -1 { matchStart = i }

            used[subWord] = used[subWord]! + 1

            i += wordLen

            if used == words {
                answer.append(matchStart)
                i = matchStart + 1
                matchStart = -1
                for word in used.keys { used[word] = 0 }
            }
        } else {
            if matchStart != -1 { i = matchStart + 1 }
            if matchStart == -1 { i += 1 }
            matchStart = -1
            for word in used.keys { used[word] = 0 }
        }
    }

    return answer
}
