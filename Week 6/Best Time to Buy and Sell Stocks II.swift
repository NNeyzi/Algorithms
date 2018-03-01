//
//  Best Time to Buy and Sell Stocks II.swift
//  
//
//  Created by Nader Neyzi on 3/1/18.
//

import Foundation

/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).

 Example :

 Input : [1 2 3]
 Return : 2
*/

func maxProfit(_ A: [Int]) -> Int {
    if A.count < 2 { return 0 }
    var ans = 0
    var i = 0

    while i < A.count {
        while (i+1) < A.count && A[i] >= A[i+1] {
            i += 1
        }

        if i >= (A.count - 1) { break }

        ans -= A[i]

        i += 1

        while (i+1) < A.count && A[i] <= A[i+1] {
            i += 1
        }

        ans += A[i]
    }


    return ans
}
