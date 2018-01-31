//
//  Allocate Books.swift
//  
//
//  Created by Nader Neyzi on 1/30/18.
//

import Foundation

/*
 N number of books are given.
 The ith book has Pi number of pages.
 You have to allocate books to M number of students so that maximum number of pages alloted to a student is minimum. A book will be allocated to exactly one student. Each student has to be allocated at least one book. Allotment should be in contiguous order, for example: A student cannot be allocated book 1 and book 3, skipping book 2.

 NOTE: Return -1 if a valid assignment is not possible

 Input:

 List of Books
 M number of students
 Your function should return an integer corresponding to the minimum number.

 Example:

 P : [12, 34, 67, 90]
 M : 2

 Output : 113

 There are 2 number of students. Books can be distributed in following fashion :
 1) [12] and [34, 67, 90]
 Max number of pages is allocated to student 2 with 34 + 67 + 90 = 191 pages
 2) [12, 34] and [67, 90]
 Max number of pages is allocated to student 2 with 67 + 90 = 157 pages
 3) [12, 34, 67] and [90]
 Max number of pages is allocated to student 1 with 12 + 34 + 67 = 113 pages

 Of the 3 cases, Option 3 has the minimum pages = 113.

 */

func books(_ A: inout [Int], _ B: inout Int) -> Int {
    if A.count < B { return -1 }

    var sum:Int = 0
    for book in A {
        sum += book
    }

    var start = 0
    var end = sum
    var result = Int.max

    while start <= end {
        var mid = (start + end) / 2

        if isPossible(&A, &B, mid) {

            result = min(result, mid)

            end = mid - 1
        } else {
            start = mid + 1
        }
    }

    return result
}

func isPossible(_ A: inout [Int], _ B: inout Int, _ min: Int) -> Bool {
    var requiredStudents = 1
    var sum = 0

    for book in A {
        if book > min { return false }

        if (sum + book) > min {
            requiredStudents += 1

            sum = book

            if requiredStudents > B { return false }
        } else {
            sum += book
        }
    }
    return true
}

