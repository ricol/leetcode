import Cocoa

class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var hash = [String: Int]()
        var max = 0
        var result = ""
        let chars = Array(paragraph)
        var word = [Character]()
        for i in 0..<chars.count {
            let c = (Character)(chars[i].lowercased())
            if ("a"..."z").contains(c) {
                word.append(c)
            }else {
                let s = String(word)
                if !s.isEmpty {
                    if hash[s] == nil { hash[s] = 0 }
                    hash[s]! += 1
                    if hash[s]! > max && !banned.contains(s) { max = hash[s]!; result = s }
                }
                word.removeAll()
            }
        }
        let s = String(word)
        if !s.isEmpty {
            if hash[s] == nil { hash[s] = 0 }
            hash[s]! += 1
            if hash[s]! > max && !banned.contains(s) { max = hash[s]!; result = s }
        }
        word.removeAll()
        return result
    }
}

for (i, r) in [(["Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"]], "ball"),
    (["a.", []], "a"),
(["Bob", []], "bob"),
               (["Bob!", ["hit"]], "bob")] {
    let a = Solution().mostCommonWord(i.first! as! String, i.last! as! [String])
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
