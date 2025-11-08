// Problem 58: Length of Last Word
// Level : Easy
// Given a string s consisting of words and spaces, return the length of the last word in the string.
// A word is a maximal substring consisting of non-space characters only.


class Solution {
  int lengthOfLastWord(String s) {
    s = s.trim(); // Remove leading and trailing spaces
    List<String> words = s.split(' ');
    return words.last.length;
  }
}
