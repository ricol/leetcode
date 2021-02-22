class Solution
{
    func strStr(_ haystack: String, _ needle: String) -> Int
    {
        if haystack == needle { return 0 }
        let str = [Character](haystack)
        let substr = [Character](needle)
        for i in (0..<str.count)
        {
            var bFound = true
            for j in (0..<substr.count)
            {
                if i + j < str.count
                {
                    if substr[j] != str[i + j]
                    {
                        bFound = false
                        break
                    }
                }else
                {
                    bFound = false
                    break
                }
            }
            if bFound { return i }
        }
        return -1
    }
}

for (haystack, needle, answer) in [("hello", "ll", 2), ("aaaaa", "bba", -1), ("", "", 0)]
{
    let result = Solution().strStr(haystack, needle)
    print("haystack: \(haystack), needle: \(needle), answer: \(answer), result: \(result) -> \(answer == result ? "pass" : "fail")")
}
