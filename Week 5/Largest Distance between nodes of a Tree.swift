//
//  Largest Distance between nodes of a Tree.swift
//  
//
//  Created by Nader Neyzi on 2/18/18.
//

import Foundation

/*
 Find largest distance
 Given an arbitrary unweighted rooted tree which consists of N (2 <= N <= 40000) nodes. The goal of the problem is to find largest distance between two nodes in a tree. Distance between two nodes is a number of edges on a path between the nodes (there will be a unique path between any pair of nodes since it is a tree). The nodes will be numbered 0 through N - 1.

 The tree is given as an array P, there is an edge between nodes P[i] and i (0 <= i < N). Exactly one of the i’s will have P[i] equal to -1, it will be root node.

 Example:
 If given P is [-1, 0, 0, 0, 3], then node 0 is the root and the whole tree looks like this:
 0
 /  |  \
 1   2   3
 \
 4
 One of the longest path is 1 -> 0 -> 3 ->
*/

func solve(_ A: inout [Int]) -> Int {
    var graph: [Int:[Int]] = [:]
    var root = 0

    for i in 0..<A.count {
        let val = i
        let edgeTo = A[i]
        if A[i] == -1 {
            root = i
            graph[i] = []
        }else {
            if graph[val] == nil {
                graph[val] = [edgeTo]
            }else {
                graph[val]!.append(edgeTo)
            }

            if graph[edgeTo] == nil {
                graph[edgeTo] = [val]
            } else {
                graph[edgeTo]!.append(val)
            }
        }
    }

    var depthAndValue1 = deepestVertex(root, graph)
    var depthAndValue2 = deepestVertex(depthAndValue1[1], graph)

    return depthAndValue2[0]
}

func deepestVertex(_ start: Int, _ graph: [Int:[Int]]) -> [Int] {
    var queue = [start]
    let visited = NSMutableSet()
    var last = start
    visited.add(start)
    var depth = 0

    while queue.count > 0 {
        let queueCount = queue.count

        for _ in 1...queueCount {
            let current = queue.removeLast()

            for val in graph[current]! {
                if !visited.contains(val) {
                    queue.insert(val, at: 0)
                    visited.add(val)
                }
            }

            last = current
        }

        depth += 1
    }

    return [depth - 1, last]
}
