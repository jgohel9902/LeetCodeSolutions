// Problem 39 : Combination File
// Level : Medium
// Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
// The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
// The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func backtrack(_ start: Int, _ current: [Int], _ total: Int) {
            if total == target {
                result.append(current)
                return
            }
            if total > target { return }
            
            for i in start..<candidates.count {
                backtrack(i, current + [candidates[i]], total + candidates[i])
            }
        }
        
        backtrack(0, [], 0)
        return result
    }
}
