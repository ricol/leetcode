class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        for l in letters {
            if l > target { return l }
        }
        return letters.first!
    }
}

for (i, r) in [((["c", "f", "j"], "a"), "c"),
               ((["c", "f", "j"], "c"), "f"),
               ((["x", "x", "y", "y"], "z"), "x")] as [(([Character], Character), Character)] {
    let a = Solution().nextGreatestLetter(i.0, i.1)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
