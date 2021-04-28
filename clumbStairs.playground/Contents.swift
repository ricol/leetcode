class Solution
{
    var hash = [Int: Int]()
    
    func climbStairs(_ n: Int) -> Int
    {
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        
        if let v = hash[n] { return v }
        
        let v1 = climbStairs(n - 1)
        let v2 = climbStairs(n - 2)
        hash[n] = v1 + v2
        
        return v1 + v2
    }
}

for (input, result) in [(2, 2), (3, 3), (4, 5)]
{
    let r = Solution().climbStairs(input)
    print("input: \(input), result: \(result), my result: \(r) -> \(result == r ? "pass" : "fail")")
}
