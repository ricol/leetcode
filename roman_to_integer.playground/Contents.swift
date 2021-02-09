class Solution
{
    func romanToInt(_ s: String) -> Int
    {
        let mapping: [Character: Double] = ["I": 1, "V": 5, "X": 1e1, "L": 5e1, "C": 1e2, "D": 5e2, "M": 1e3]
        let chars = [Character](s)
        var result = 0.0
        var i = chars.count - 1
        while i >= 0
        {
            if let value = mapping[chars[i]]
            {
                if i - 1 >= 0, let previous = mapping[chars[i - 1]], previous < value
                {
                    result += value - previous
                    i -= 1
                }else
                {
                    result += value
                }
            }
            i -= 1
        }
        return Int(result)
    }
}

for (input, answer) in [("III", 3), ("IV", 4), ("IX", 9), ("LVIII", 58), ("MCMXCIV", 1994)]
{
    let result = Solution().romanToInt(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(answer == result ? "pass" : "fail")")
}
