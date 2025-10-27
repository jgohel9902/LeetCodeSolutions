#  Problem 9, Level : Easy
#  Given an integer x, return true if x is a palindrome, and false otherwise.

# Solution

class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        # Negative numbers are never palindrome
        if x < 0:
            return False
        
        # Numbers ending with 0 (but not 0 itself) can't be palindrome
        if x % 10 == 0 and x != 0:
            return False

        reversed_half = 0
        while x > reversed_half:
            # Take last digit from x and add to reversed_half
            reversed_half = reversed_half * 10 + x % 10
            x //= 10

        # If length is even, x == reversed_half
        # If odd, drop middle digit from reversed_half (reversed_half // 10)
        return x == reversed_half or x == reversed_half // 10
