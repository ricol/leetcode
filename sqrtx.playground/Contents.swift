class Solution
{
    func mySqrt(_ x: Int) -> Int
    {
        var max = x, min = 0, r = Int((max + min) / 2), p = 0
        while max - min > 1
        {
            p = r * r
            if p > x
            {
                max = r
            }else if p < x
            {
                min = r
            }else
            {
                return r
            }
            r = Int((max + min) / 2)
        }
        return x == 1 ? 1 : r
    }
}

for (input, answer) in [(4, 2), (8, 2), (9, 3), (10, 3), (1, 1), (0, 0)]
{
    let r = Solution().mySqrt(input)
    print("\(input), \(answer), \(r)...\(r == answer ? "pass" : "fail")")
}
