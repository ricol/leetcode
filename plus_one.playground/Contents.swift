class Solution
{
    func plusOne(_ digits: [Int]) -> [Int]
    {
        var r = [Int]()
        var i = digits.count - 1
        var s = digits[i] + 1
        var d = s % 10
        var e = s / 10
        r.insert(d, at: 0)
        i -= 1
        while i >= 0
        {
            s = digits[i] + e
            d =  s % 10
            e = s / 10
            r.insert(d, at: 0)
            i -= 1
        }
        if e > 0 { r.insert(e, at: 0) }
        return r
    }
}

for (input, answer) in [([1, 2, 3], [1, 2, 4]), ([4, 3, 2, 1], [4, 3, 2, 2]), ([0], [1]), ([9], [1, 0])]
{
    let r = Solution().plusOne(input)
    print("\(input) -> \(r) -> \(r == answer ? "pass" : "fail")")
}
