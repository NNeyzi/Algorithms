//
//  Integer To Roman.swift
//  
//
//  Created by Nader Neyzi on 1/22/18.
//

import Foundation

/*
 Given an integer, convert it to a roman numeral, and return a string corresponding to its roman numeral version

 Input is guaranteed to be within the range from 1 to 3999.

 Example :

 Input : 5
 Return : "V"

 Input : 14
 Return : "XIV"
*/

func intToRoman(_ A: inout Int) -> String {
    if A == 0 { return "" }

    var romans = ["I", "X", "C", "M"]
    //             1    10  100  1000
    var romans5 = ["V", "L", "D"]
    //              5   50    500

    var numReversed:[Int] = []

    var strNum = String(A)
    for char in strNum {
        numReversed.insert(Int(String(char))!, at: 0)
    }

    var answer = ""

    for i in 0..<numReversed.count {
        var digit = numReversed[i]
        if digit == 0 {
            continue
        } else if digit < 4 {
            for j in 1...digit {
                answer = romans[i] + answer
            }
        } else if digit == 4 {
            answer = romans5[i] + answer
            answer = romans[i] + answer
        } else if digit == 5 {
            answer = romans5[i] + answer
        } else if digit < 9 {
            for j in 6...digit {
                answer = romans[i] + answer
            }
            answer = romans5[i] + answer
        } else if digit == 9 {
            answer = romans[i+1] + answer
            answer = romans[i] + answer
        }
    }

    return answer
}
