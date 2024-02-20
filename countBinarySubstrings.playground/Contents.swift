class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var total = 0
        var zeros = 0
        var ones = 0
        var previous: Character? = nil
        s.forEach { c in
            if c == "0" {
                if previous == "1" { zeros = 0 }
                zeros += 1
                if zeros <= ones { total += 1}
            }else if c == "1" {
                if previous == "0" { ones = 0 }
                ones += 1
                if ones <= zeros { total += 1}
            }
            previous = c
        }
        return total
    }
}

for (i, r) in [("00110011", 6), ("10101", 4)] {
    let a = Solution().countBinarySubstrings(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
