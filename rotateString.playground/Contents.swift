class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        let sChars = Array(s)
        let goalChars = Array(goal)
        if sChars.count != goalChars.count { return false }
        
        var indexes = [Int]()
        for i in 0..<goalChars.count {
            let c = goalChars[i]
            if c == sChars[0] { indexes.append(i) }
        }
        for index in indexes {
            var result = true
            for i in index..<goalChars.count {
                if sChars[i - index] != goalChars[i] {
                    result = false
                    break
                }
            }
            for i in 0..<index {
                if sChars[sChars.count - index + i] != goalChars[i] {
                    result = false
                    break
                }
            }
            if result { return true }
        }
        return false
    }
}

for (i, r) in [(["abcde", "cdeab"], true),
               (["abcde", "abced"], false),
               (["bbbacddceeb", "ceebbbbacdd"], true)] {
    let a = Solution().rotateString(i.first!, i.last!)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
