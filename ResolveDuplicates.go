// Problem 26 : Remove Duplicates from Sorted Array
// Level : Easy
// Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.
//Consider the number of unique elements in nums to be k​​​​​​​​​​​​​​. After removing duplicates, return the number of unique elements k.
//The first k elements of nums should contain the unique numbers in sorted order. The remaining elements beyond index k - 1 can be ignored.

func removeDuplicates(nums []int) int {
    if len(nums) == 0 {
        return 0
    }

    k := 1 // index to place the next unique element

    for i := 1; i < len(nums); i++ {
        if nums[i] != nums[i-1] {
            nums[k] = nums[i]
            k++
        }
    }

    return k
}
