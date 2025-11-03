# Problem 30 : Substring with Concatenation of All Words
# Level : HARD
# You are given a string s and an array of strings words. All the strings of words are of the same length.
# A concatenated string is a string that exactly contains all the strings of any permutation of words concatenated.
#For example, if words = ["ab","cd","ef"], then "abcdef", "abefcd", "cdabef", "cdefab", "efabcd", and "efcdab" are all concatenated strings. "acdbef" is not a concatenated string because it is not the concatenation of any permutation of words.
# Return an array of the starting indices of all the concatenated substrings in s. You can return the answer in any order.

#---------------------------------------------------------------------------------------------------------

# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  return [] if s.empty? || words.empty?

  word_len = words[0].length
  total_len = word_len * words.length
  return [] if s.length < total_len

  word_count = Hash.new(0)
  words.each { |w| word_count[w] += 1 }

  result = []

  (0...word_len).each do |i|
    left = i
    count = 0
    seen = Hash.new(0)

    (i...s.length - word_len + 1).step(word_len) do |j|
      word = s[j, word_len]
      if word_count.key?(word)
        seen[word] += 1
        count += 1

        # If a word appears too many times, move the left pointer
        while seen[word] > word_count[word]
          left_word = s[left, word_len]
          seen[left_word] -= 1
          count -= 1
          left += word_len
        end

        # If all words matched, record the start index
        if count == words.length
          result << left
          left_word = s[left, word_len]
          seen[left_word] -= 1
          count -= 1
          left += word_len
        end
      else
        seen.clear
        count = 0
        left = j + word_len
      end
    end
  end

  result
end
