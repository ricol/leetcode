class Solution
{
    func strStr(_ haystack: String, _ needle: String) -> Int
    {
        if needle == "" { return 0 }
        if needle.count > haystack.count { return -1 }
        let h = [Character](haystack)
        let n = [Character](needle)
        var index: Int?
        for i in (0..<h.count)
        {
            if h.count - i + 1 <= n.count { break }
            index = i
            for j in (0..<n.count)
            {
                if h[j + i] != n[j] { index = nil; break }
            }
            if let i = index { return i }
        }
        
        return index ?? -1
    }
}

for (haystack, needle, result) in [("hello", "ll", 2), ("aaaaa", "bba", -1), ("", "", 0), ("aaa", "aaaa", -1), ("mississippi", "issipi", -1)]
{
    let r = Solution().strStr(haystack, needle)
    print("haystack: \(haystack), needle: \(needle), result: \(result), r: \(r) -> \(result == r)")
}
