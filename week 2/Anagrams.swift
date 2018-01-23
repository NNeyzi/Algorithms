//
//  Anagrams.swift
//  
//
//  Created by Nader Neyzi on 1/23/18.
//

import Foundation

/*
 Given an array of strings, return all groups of strings that are anagrams. Represent a group by a list of integers representing the index in the original list. Look at the sample case for clarification.

 Anagram : a word, phrase, or name formed by rearranging the letters of another, such as 'spar', formed from 'rasp'
 Note: All inputs will be in lower-case.
 Example :

 Input : cat dog god tca
 Output : [[1, 4], [2, 3]]
 cat and tca are anagrams which correspond to index 1 and 4.
 dog and god are another set of anagrams which correspond to index 2 and 3.
 The indices are 1 based ( the first element has index 1 instead of index 0).

 Ordering of the result : You should not change the relative ordering of the words / phrases w
*/

func anagrams(_ A: [String]) -> [[Int]] {

    var dict:NSMutableDictionary = NSMutableDictionary()

    for i in 0..<A.count {
        let word = A[i]
        var letters = NSMutableDictionary()
        for char in word {
            if letters[char] == nil {
                letters[char] = 1
            } else {
                var num = letters[char] as! Int
                letters[char] = num + 1
            }
        }

        if dict[letters] == nil {
            var indexes = NSMutableArray()
            indexes = [i+1]
            dict[letters] = indexes
        } else {
            var indexes = dict[letters] as! NSMutableArray
            indexes.add(i+1)
            dict[letters] = indexes
        }
    }

    var answer = NSMutableArray()
    for (key, value) in dict {
        var arr = value as! NSArray
        if arr.count > 1 {
            answer.add(arr)
        }
    }

    return answer as! [[Int]]

}

//Runs correct on Xcode, doesn't compile in interviewbit
