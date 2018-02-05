//
//  File.swift
//  
//
//  Created by Nader Neyzi on 2/4/18.
//


/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.

 Here are few examples.

 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
*/

public int searchInsert(ArrayList<Integer> a, int b) {
    return binarySearch(a, 0, (a.size() - 1), b);
}

static int binarySearch(ArrayList<Integer> arr, int low, int high, int key)
{
    if (high < low)
    return low;

    int mid = (low + high) / 2;

    if (key == arr.get(mid))
    return mid;
    if (key > arr.get(mid))
    return binarySearch(arr, (mid + 1), high, key);

    return binarySearch(arr, low, (mid -1), key);
}
