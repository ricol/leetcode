class Solution
{
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int
    {
        var j = 0
        for i in (0..<nums.count)
        {
            if nums[i] != val
            {
                nums[j] = nums[i]
                j += 1
            }
        }
        return j
    }
    
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int
    {
        nums = nums.filter { (n) -> Bool in
            n != val
        }
        return nums.count
    }
}

for (nums, val, answer) in [([3, 2, 2, 3], 3, 2), ([0, 1, 2, 2, 3, 0, 4, 2], 2, 5)]
{
    var array = nums
    let r = Solution().removeElement(&array, val)
    print("checking...\(r == answer ? "pass" : "failed")")
}
