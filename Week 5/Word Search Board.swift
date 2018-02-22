//
//  Word Search Board.swift
//  
//
//  Created by Nader Neyzi on 2/22/18.
//

import Foundation

/*
 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The cell itself does not count as an adjacent cell.
 The same letter cell may be used more than once.

 Example :

 Given board =

 [
 ["ABCE"],
 ["SFCS"],
 ["ADEE"]
 ]
 word = "ABCCED", -> returns 1,
 word = "SEE", -> returns 1,
 word = "ABCB", -> returns 1,
 word = "ABFSAB" -> returns 1
 word = "ABCD" -> returns 0
 Note that 1 corresponds to true, and 0 corresponds to false.
*/

func exist(_ A: inout [String], _ B: inout String) -> Int {
    var board:[[Character]] = []
    var word: [Character] = Array(B)
    var ans = 0

    for str in A {
        var letters = Array(str)
        board.append(letters)
    }

    for y in 0..<board.count {
        for x in 0..<board[y].count {
            var pos = [x, y]
            var i = 0
            if board[y][x] == word[0] { findLetters(i, word, &pos, board, &ans) }
        }
    }

    return ans
}

func findLetters(_ index: Int, _ word: [Character], _ position: inout [Int], _ board: [[Character]], _ ans: inout Int) {
    var x = 0, y = 0
    var newIndex = index + 1

    if newIndex >= word.count {
        ans = 1
        return
    }

    //Top
    x = position[0]
    y = position[1] - 1
    var newPos = [x, y]
    if isInBoard(x, y, board) && board[y][x] == word[newIndex] { findLetters(newIndex, word, &newPos, board, &ans) }

    //Right
    x = position[0] + 1
    y = position[1]
    newPos = [x, y]
    if isInBoard(x, y, board) && board[y][x] == word[newIndex] { findLetters(newIndex, word, &newPos, board, &ans) }

    //Bottom
    x = position[0]
    y = position[1] + 1
    newPos = [x, y]
    if isInBoard(x, y, board) && board[y][x] == word[newIndex] { findLetters(newIndex, word, &newPos, board, &ans) }

    //Left
    x = position[0] - 1
    y = position[1]
    newPos = [x, y]
    if isInBoard(x, y, board) && board[y][x] == word[newIndex] { findLetters(newIndex, word, &newPos, board, &ans) }

}

func isInBoard(_ x: Int, _ y: Int, _ board: [[Character]]) -> Bool {
    return x >= 0 && y >= 0 && y < board.count && x < board[y].count
}

// This is not the most optimal solution
