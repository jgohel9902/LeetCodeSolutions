# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).


class Solution:
    def reverse(self, x):
        INT_MAX = 2**31 - 1
        INT_MIN = -2**31

        rev = 0
        sign = -1 if x < 0 else 1
        x = abs(x)

        while x != 0:
            digit = x % 10
            x //= 10

            # Check for overflow before updating rev
            if rev > INT_MAX // 10 or (rev == INT_MAX // 10 and digit > 7):
                return 0

            rev = rev * 10 + digit

        return sign * rev
