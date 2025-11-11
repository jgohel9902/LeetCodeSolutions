// Given an integer array nums, handle multiple queries of the following types:
// Update the value of an element in nums.
// Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
// Implement the NumArray class:

// NumArray(int[] nums) Initializes the object with the integer array nums.
// void update(int index, int val) Updates the value of nums[index] to be val.
// int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).



public class NumArray
{
    private int[] nums;
    private int[] bit; // Binary Indexed Tree
    private int n;

    public NumArray(int[] nums)
    {
        this.nums = new int[nums.Length];
        this.bit = new int[nums.Length + 1];
        this.n = nums.Length;

        for (int i = 0; i < nums.Length; i++)
        {
            Update(i, nums[i]);
        }
    }

    public void Update(int index, int val)
    {
        int diff = val - nums[index];
        nums[index] = val;
        for (int i = index + 1; i <= n; i += i & -i)
        {
            bit[i] += diff;
        }
    }

    private int PrefixSum(int i)
    {
        int sum = 0;
        for (int idx = i + 1; idx > 0; idx -= idx & -idx)
        {
            sum += bit[idx];
        }
        return sum;
    }

    public int SumRange(int left, int right)
    {
        return PrefixSum(right) - PrefixSum(left - 1);
    }
}
