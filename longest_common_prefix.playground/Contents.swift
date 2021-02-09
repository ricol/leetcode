class Solution
{
    func longestCommonPrefix(_ strs: [String]) -> String
    {
        var s = [Character]()
        var arrays = [[Character]]()
        var i = 0
        var min = Int.max
        strs.forEach { (s) in
            arrays.append([Character](s))
            if s.count < min { min = s.count }
        }
        while i < min
        {
            var bSame = true
            if let c = arrays.first?[i]
            {
                arrays.forEach { (chars) in
                    if chars[i] != c
                    {
                        bSame = false
                        return
                    }
                }
                if bSame { s.append(c) } else { break }
                i += 1
            }else { break }
        }
        
        return String(s)
    }
}

for (input, answer) in [(["flower","flow","flight"], "fl"), (["dog","racecar","car"], ""), (["cir", "car"], "c")]
{
    let result = Solution().longestCommonPrefix(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(result == answer ? "pass" : "fail")")
}
