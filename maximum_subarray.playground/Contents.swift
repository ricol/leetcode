class Solution
{
    func maxSubArray(_ nums: [Int]) -> Int
    {
        var sum = 0
        var max: Int?
        for i in (0..<nums.count)
        {
            sum = 0
            for j in (i..<nums.count)
            {
                sum += nums[j]
                if let m = max
                {
                    if (sum > m) { max = sum }
                }else
                {
                    max = sum
                }
            }
        }
        return max ?? nums.first ?? 0
    }
}

for (input, answer) in [([-2,1,-3,4,-1,2,1,-5,4], 6), ([5,4,-1,7,8], 23), ([1], 1), ([-1], -1)]
{
    let result = Solution().maxSubArray(input)
    print("input: \(input), answer: \(answer), result: \(result), -> \(answer == result ? "pass" : "fail")")
}
