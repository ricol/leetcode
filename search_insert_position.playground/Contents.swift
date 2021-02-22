class Solution
{
    func searchInsert(_ nums: [Int], _ target: Int) -> Int
    {
        for i in (0..<nums.count)
        {
            if nums[i] == target { return i }
            else if nums[i] > target { return i }
        }
        return nums.count
    }
}

for (input, target, answer) in [([1, 3, 5, 6], 5, 2), ([1, 3, 5, 6], 2, 1), ([1, 3, 5, 6], 7, 4), ([1, 3, 5, 6], 0, 0), ([1], 0, 0)]
{
    let result = Solution().searchInsert(input, target)
    print("input: \(input), target: \(target), answer: \(answer), result: \(result) -> \(result == answer ? "pass" : "fail")")
}
