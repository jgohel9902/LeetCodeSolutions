// Problem 70 : Climbing Stairs
// Level : Easy
// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?




impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
        if n <= 2 {
            return n;
        }
        let mut first = 1;
        let mut second = 2;
        for _ in 3..=n {
            let temp = first + second;
            first = second;
            second = temp;
        }
        second
    }
}
