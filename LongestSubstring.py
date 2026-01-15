# Given a string s, find the length of the longest substring without duplicate characters.
# Constraints:
# 0 <= s.length <= 5 * 104
# s consists of English letters, digits, symbols and spaces.
class Solution:
    def lengthOfLongestSubstring(self, s):
        seen = {}
        left = 0
        best = 0

        for right in range(len(s)):
            ch = s[right]

            if ch in seen and seen[ch] >= left:
                left = seen[ch] + 1

            seen[ch] = right
            best = max(best, right - left + 1)

        return best
