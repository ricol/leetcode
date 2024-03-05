class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var hash = [Character: Int]()
        for j in jewels {
            if hash[j] == nil { hash[j] = 0 }
        }
        for s in stones {
            if hash[s] == nil { continue }
            hash[s]! += 1
        }
        var s = 0
        for v in hash.values { s += v }
        return s
    }
}

for (i, r) in [(["aA", "aAAbbbb"], 3), (["z", "ZZ"], 0)] {
    let a = Solution().numJewelsInStones(i.first!, i.last!)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
