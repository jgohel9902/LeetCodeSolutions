# Problem 4 : Median of Two Sorted Arrays. 
# LEVEL : Hard
# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
#The overall run time complexity should be O(log (m+n)).



class Solution:
    def findMedianSortedArrays(self, nums1, nums2):
        if len(nums1) > len(nums2):
            nums1, nums2 = nums2, nums1

        m, n = len(nums1), len(nums2)
        total = m + n
        half = total // 2

        left, right = 0, m
        while True:
            i = (left + right) // 2  # Partition index for nums1
            j = half - i             # Partition index for nums2

            # Handle edges with infinities
            nums1_left = nums1[i - 1] if i > 0 else float('-inf')
            nums1_right = nums1[i] if i < m else float('inf')
            nums2_left = nums2[j - 1] if j > 0 else float('-inf')
            nums2_right = nums2[j] if j < n else float('inf')

            # Correct partition found
            if nums1_left <= nums2_right and nums2_left <= nums1_right:
                if total % 2:
                    return float(min(nums1_right, nums2_right))
                return (max(nums1_left, nums2_left) + min(nums1_right, nums2_right)) / 2
            elif nums1_left > nums2_right:
                right = i - 1
            else:
                left = i + 1
