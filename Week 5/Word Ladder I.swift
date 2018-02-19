//
//  Word Ladder I.swift
//  
//
//  Created by Nader Neyzi on 2/18/18.
//

import Foundation

/*
 Given two words (start and end), and a dictionary, find the length of shortest transformation sequence from start to end, such that:

 You must change exactly one character in every transformation
 Each intermediate word must exist in the dictionary
 Example :

 Given:

 start = "hit"
 end = "cog"
 dict = ["hot","dot","dog","lot","log"]
 As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.

 Note that we account for the length of the transformation path instead of the number of transformation itself.

 Note:
 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
*/

func countDistance(_ words: inout [String], _ start: String, end: String) -> Int {
    words.append(start)
    words.append(end)
    var graph:[String:[String]] = [:]
    for word in words {
        for other in words {
            if isOneLetterDiff(word, other) {
                if graph[word] == nil {
                    graph[word] = [other]
                } else {
                    graph[word]!.append(other)
                }
            }
        }
    }

    var minCount = INT_MAX
    var queue:[String] = [start]
    var visited:Set<String> = []
    while queue.count > 0 {
        var current = queue.removeLast()
        if current == end {
            minCount = Int32(min(visited.count - 1, Int(minCount)))
        }

        if !visited.contains(current) {
            visited.insert(current)
            var words = graph[current]!
            for word in words {
                queue.insert(word, at: 0)
            }
        }
    }

    if minCount == INT_MAX { return 0 }

    return Int(minCount)

}

func isOneLetterDiff(_ a: String, _ b: String) -> Bool {
    let A = Array(a)
    let B = Array(b)
    var diff = 0

    for i in 0..<A.count {
        if A[i] != B[i] { diff += 1}
    }

    return diff == 1
}
