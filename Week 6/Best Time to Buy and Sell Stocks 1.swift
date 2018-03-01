//
//  Best Time to Buy and Sell Stocks 1.swift
//  
//
//  Created by Nader Neyzi on 2/28/18.
//

import Foundation

/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.

 Example :

 Input : [1 2]
 Return :  1
 */

func maxProfit(_ A: [Int]) -> Int {
    if A.count < 2 { return 0 }
    var maxProfit = Int.min
    var maxSell = A[(A.count-1)]

    for i in (0..<(A.count-1)).reversed() {
        let currentBuy = A[i]
        let currentProfit = maxSell - currentBuy
        maxProfit = max(maxProfit, currentProfit)
        maxSell = max(maxSell, currentBuy)
    }

    if maxProfit < 0 { return 0 }
    return maxProfit
}
