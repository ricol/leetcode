class Solution
{
    func longestCommonPrefix(_ strs: [String]) -> String
    {
        return ""
    }
}

for (input, answer) in [(["flower","flow","flight"], "fl"), (["dog","racecar","car"], "")]
{
    let result = Solution().longestCommonPrefix(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(result == answer ? "pass" : "fail")")
}
