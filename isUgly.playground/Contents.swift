class Solution {
    func isUgly(_ n: Int) -> Bool {
        return true
    }
}

for (i, r) in [(6, true), (1, true), (14, false)] {
    let a = Solution().isUgly(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
