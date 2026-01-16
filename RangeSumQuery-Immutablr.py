# Given an integer array nums, handle multiple queries of the following type:
# Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
# Implement the NumArray class:
# NumArray(int[] nums) Initializes the object with the integer array nums.
# int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right])

class NumArray:
    def __init__(self, nums):
        # Create prefix sum array
        self.prefix = [0]
        for num in nums:
            self.prefix.append(self.prefix[-1] + num)

    def sumRange(self, left, right):
        return self.prefix[right + 1] - self.prefix[left]
