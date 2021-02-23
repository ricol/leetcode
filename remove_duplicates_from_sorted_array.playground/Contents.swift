class Solution
{
    func removeDuplicates(_ nums: inout [Int]) -> [Int]
    {
        var hash = [Int: Bool]()
        var i = 0
        while i < nums.count
        {
            let num = nums[i]
            if let _ = hash[num]
            {
                nums.remove(at: i)
            }else
            {
                hash[num] = true
                i += 1
            }
        }
        
        return nums
    }
}

for (input, _, answer) in [([1,1,2], 2, [1, 2]), ([0,0,1,1,1,2,2,3,3,4], 5, [0,1,2,3,4])]
{
    var modified = input
    let result = Solution().removeDuplicates(&modified)
    print("input: \(input) checking...-> \(result == answer ? "pass" : "fail")")
}
