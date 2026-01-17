# Given a string s, return the longest palindromic substring in s.
# Constraints:

#1 <= s.length <= 1000
#s consist of only digits and English letters.

class Solution:
    def longestPalindrome(self, s):
        n = len(s)
        if n <= 1:
            return s

        best_l = 0
        best_r = 0

        def expand(l, r):
            while l >= 0 and r < n and s[l] == s[r]:
                l -= 1
                r += 1
            return l + 1, r - 1

        for i in range(n):
            # Odd length palindrome
            l1, r1 = expand(i, i)
            if r1 - l1 > best_r - best_l:
                best_l, best_r = l1, r1

            # Even length palindrome
            l2, r2 = expand(i, i + 1)
            if r2 - l2 > best_r - best_l:
                best_l, best_r = l2, r2

        return s[best_l:best_r + 1]
