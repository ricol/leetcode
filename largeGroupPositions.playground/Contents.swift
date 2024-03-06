class Solution {
    func largeGroupPositions(_ s: String) -> [[Int]] {
        var result = [[Int]]()
        let chars = Array(s)
        var index = 0
        var previous: Character?
        var start: Int = index
        while index < chars.count {
            if let previous {
                if previous != chars[index] {
                    if index - start >= 3 {
                        result.append([start, index - 1])
                    }
                    start = index
                }
            }
            previous = chars[index]
            index += 1
        }
        if index - start >= 3 {
            result.append([start, index - 1])
        }
        result.sort { a, b in
            a.first! < b.first!
        }
        return result
    }
    
    func largeGroupPositions1(_ s: String) -> [[Int]] {
        var result = [[Int]]()
        let chars = Array(s)
        var index = 0
        var previous: Character?
        var group = [Int]()
        var groupChars = [Character]()
        while index < chars.count {
            if let previous {
                if previous != chars[index] {
                    if group.count >= 3 {
                        result.append([group.first!, group.first! + group.count - 1])
                    }
                    group.removeAll()
                    groupChars.removeAll()
                }
            }
            group.append(index)
            groupChars.append(chars[index])
            previous = chars[index]
            index += 1
        }
        if group.count >= 3 {
            result.append([group.first!, group.first! + group.count - 1])
        }
        result.sort { a, b in
            a.first! < b.first!
        }
        return result
    }
}

for (i, r) in [("abbxxxxzzy", [[3,6]]),
               ("abcdddeeeeaabbbcd", [[3,5],[6,9],[12,14]]),
               ("abc", [])] {
    let a = Solution().largeGroupPositions(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
    let b = Solution().largeGroupPositions1(i)
    print("input: \(i), expect: \(r), actual: \(b) -> \(r == b ? "pass" : "fail")")
}
