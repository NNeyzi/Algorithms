//
//  Valid Path.swift
//  
//
//  Created by Nader Neyzi on 2/18/18.
//

import Foundation

/*
 There is a rectangle with left bottom as  (0, 0) and right up as (x, y). There are N circles such that their centers are inside the rectangle. Radius of each circle is R. Now we need to find out if it is possible that we can move from (0, 0) to (x, y) without touching any circle.
 Note : We can move from any cell to any of its 8 adjecent neighbours and we cannot move outside the boundary of the rectangle at any point of time.

 Constraints
 0 <= x , y , R <= 100
 1 <= N <= 1000
 Center of each circle would lie within the grid

 Input
 Input contains x, y , N , R  and two array of size N containing centers of circles.
 The ith index of first array contains x co-ordinate of the ith circle and ith index of second array contains the y co-ordinate of the ith circle.

 Output
 YES or NO depending on weather it is possible to reach cell  (x,y) or not starting from (0,0).

 Sample Input
 2 3 1 1
 2
 3
 Sample Output
 NO
 */

func solve(_ A: inout Int, _ B: inout Int, _ C: inout Int, _ D: inout Int, _ E: inout [Int], _ F: inout [Int]) -> String {
    let dest = [A, B]
    var visited = NSMutableSet()

    for i in 0..<E.count {
        let coo = [E[i], F[i]]
        let circle = circleCirc(coo, D, dest)
        visited.addObjects(from: circle)
    }

    var possible = false
    travel([0,0], dest, &visited, &possible)

    if possible {
        return "YES"
    }else {
        return "NO"
    }
}

func travel(_ current: [Int], _ dest: [Int], _ visited: inout NSMutableSet, _ possible: inout Bool) {
    var touching = allTouching(current, dest)


    touching = touching.filter {
        !visited.contains($0)
    }


    for coo in touching {
        if coo == dest {
            possible = true
            return
        }
        visited.add(coo)
        travel(coo, dest, &visited, &possible)
    }
}


func allTouching(_ coo: [Int], _ dest: [Int]) -> [[Int]] {
    return circleCirc(coo, 2, dest)
}

func circleCirc(_ coo: [Int], _ rad: Int, _ dest: [Int]) -> [[Int]] {
    if rad == 1 { return [coo] }
    var all:[[Int]] = []
    let x = coo[0]
    let y = coo[1]
    let r = rad - 1


    // y+
    all.append([x,y+r])
    //y+ x-
    all.append([x-r,y+r])
    //x-
    all.append([x-r,y])
    //x- y-
    all.append([x-r,y-r])
    //y-
    all.append([x,y-r])
    //y- x+
    all.append([x+r,y-r])
    //x+
    all.append([x+r,y])
    //x+ y+
    all.append([x+r,y+r])

    all = all.filter {
        $0[0] >= 0 && $0[0] <= dest[0] && $0[1] >= 0 && $0[1] <= dest[1]
    }

    return all
}
