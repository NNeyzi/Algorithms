//
//  Sum of Fibonacci Numbers.swift
//  
//
//  Created by Nader Neyzi on 2/22/18.
//

import Foundation

/*
 How many minimum numbers from fibonacci series are required such that sum of numbers should be equal to a given Number N?
 Note : repetition of number is allowed.

 Example:

 N = 4
 Fibonacci numbers : 1 1 2 3 5 .... so on
 here 2 + 2 = 4
 so minimum numbers will be 2
*/

func fibsum(_ A: inout Int) -> Int {
    var fibs = [1,1,2]

    while true {
        var sum = fibs.last! + fibs[fibs.count-2]
        if sum > A { break }
        fibs.append(sum)
    }

    var rem = A
    var count = 0
    for i in (0..<fibs.count).reversed() {
        var fib = fibs[i]

        if fib > rem { continue }

        rem -= fib
        count += 1
        if rem == 0 { return count }
    }

    return count
}
