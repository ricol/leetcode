class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        let w = words.sorted { a, b in
            a.count < b.count
        }
        var hash = [Character: Int]()
        for c in licensePlate {
            let char = (Character)(c.lowercased())
            if ("a"..."z").contains(char) {
                if hash[char] == nil { hash[char] = 0 }
                hash[char]! += 1
            }
        }
        for word in w {
            var h = [Character: Int]()
            for c in word {
                let char = (Character)(c.lowercased())
                if h[char] == nil { h[char] = 0 }
                h[char]! += 1
            }
            var isresult = true
            for (k, v) in hash {
                if h[k] == nil { isresult = false; break }
                if h[k]! < v { isresult = false; break }
            }
            if isresult { return word }
        }
        return ""
    }
}

for (i, r) in [(("1s3 PSt", ["step","steps","stripe","stepple"]), "steps"),
(("1s3 456", ["looks","pest","stew","show"]), "pest")] {
    let a = Solution().shortestCompletingWord(i.0, i.1)
    print("input: \(r), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
