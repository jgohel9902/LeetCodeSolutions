// Problem 22 : Generate Parenthesis
// Level : Medium
// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

object Solution {
    def generateParenthesis(n: Int): List[String] = {
        def backtrack(current: String, open: Int, close: Int, acc: List[String]): List[String] = {
            if (open == 0 && close == 0) current :: acc
            else {
                var res = acc
                if (open > 0) res = backtrack(current + "(", open - 1, close, res)
                if (close > open) res = backtrack(current + ")", open, close - 1, res)
                res
            }
        }
        backtrack("", n, n, Nil)
    }
}
