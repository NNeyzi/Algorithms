//
//  Best Time to Buy and Sell Stocks III.swift
//  
//
//  Created by Nader Neyzi on 3/1/18.
//

import Foundation

/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete at most two transactions.

 Note:
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).

 Example :

 Input : [1 2 1 2]
 Output : 2

 Explanation :
 Day 1 : Buy
 Day 2 : Sell
 Day 3 : Buy
 Day 4 : Sell
 */

func maxProfit(_ A: [Int]) -> Int {

    if A.count < 2 { return 0 }
    var leftProfit:[Int:Int] = [0:0]
    var maxLP = 0
    var minPrice = A[0]

    for i in 1..<A.count {
        if A[i] < minPrice {
            minPrice = A[i]
        } else {
            maxLP = max(maxLP, A[i] - minPrice)
        }
        leftProfit[i] = maxLP
    }

    var ans = leftProfit[A.count-1]!
    var maxRP = 0
    var maxPrice = A[A.count-1]

    for i in (0..<(A.count-1)).reversed() {
        if A[i] > maxPrice {
            maxPrice = A[i]
        } else {
            maxRP = max(maxRP, maxPrice - A[i])
        }
        ans = max(ans, maxRP + leftProfit[i]!)
    }


    return ans
}
