class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var hash = [Character: Int]()
        var alpha = Array("abcdefghijklmnopqrstuvwxyz")
        for i in 0..<widths.count {
            hash[alpha[i]] = widths[i]
        }
        var lines = 0
        var width = 0
        let chars = Array(s)
        var index = 0
        while index < chars.count {
            width += hash[chars[index]]!
            if width > 100 {
                width = 0
                lines += 1
            }else {
                index += 1
            }
        }
        return [lines + 1, width]
    }
}

for (i, r) in [(([10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], "abcdefghijklmnopqrstuvwxyz"), [3, 60]),
(([4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], "bbbcccdddaaa"), [2, 4])] {
    let a = Solution().numberOfLines(i.0, i.1)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
