<?php
# Problem 18 : 4Sum
# Level : Medium
#Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
# 0 <= a, b, c, d < n
# a, b, c, and d are distinct.
# nums[a] + nums[b] + nums[c] + nums[d] == target
# You may return the answer in any order.

<?php
class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[][]
     */
    function fourSum($nums, $target) {
        sort($nums);
        $n = count($nums);
        $result = [];

        for ($i = 0; $i < $n - 3; $i++) {
            if ($i > 0 && $nums[$i] == $nums[$i - 1]) continue; // skip duplicates

            for ($j = $i + 1; $j < $n - 2; $j++) {
                if ($j > $i + 1 && $nums[$j] == $nums[$j - 1]) continue; // skip duplicates

                $left = $j + 1;
                $right = $n - 1;

                while ($left < $right) {
                    $sum = $nums[$i] + $nums[$j] + $nums[$left] + $nums[$right];
                    if ($sum == $target) {
                        $result[] = [$nums[$i], $nums[$j], $nums[$left], $nums[$right]];

                        // Skip duplicates
                        while ($left < $right && $nums[$left] == $nums[$left + 1]) $left++;
                        while ($left < $right && $nums[$right] == $nums[$right - 1]) $right--;

                        $left++;
                        $right--;
                    } elseif ($sum < $target) {
                        $left++;
                    } else {
                        $right--;
                    }
                }
            }
        }
        return $result;
    }
}

// Example usage
$solution = new Solution();
print_r($solution->fourSum([1, 0, -1, 0, -2, 2], 0));
// Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
?>
