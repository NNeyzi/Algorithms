//
//  Clone Graph.swift
//  
//
//  Created by Nader Neyzi on 2/22/18.
//

import Foundation

/*
Clone an undirected graph. Each node in the graph contains a label and a list of its neighbors.
*/

class GraphNode {
    var label:Int
    var neighbors:[GraphNode]

    init(label: Int) {
        self.label = label
        self.neighbors = []
    }
}

func cloneGraph(_ node: GraphNode) -> GraphNode {
    var node = node
    var queue:[GraphNode] = []
    queue.append(node)

    var map = NSMutableDictionary()
    var nodeKey = NSValue(pointer: &node)
    map[nodeKey] = GraphNode(label: node.label)


    while !queue.isEmpty {
        var current = queue.removeLast()

        var cloneNode = map[current] as! GraphNode
        if current.neighbors.count > 0 {
            var currentNeighbors = current.neighbors

            for neighbor in currentNeighbors {
                var cloneNeighbor: GraphNode

                var neighbor = neighbor
                var neighborKey = NSValue(pointer: &neighbor)
                if map[neighborKey] != nil {
                    cloneNeighbor = map[neighborKey] as! GraphNode
                } else {
                    queue.insert(neighbor, at: 0)

                    cloneNeighbor = GraphNode(label: neighbor.label)
                    map[neighborKey] = cloneNeighbor
                }

                // add the 'cloneNodeG' to neighbour
                // vector of the cloneNodeG

                cloneNode.neighbors.append(cloneNeighbor)
            }
        }
    }

    return map[nodeKey] as! GraphNode
}
