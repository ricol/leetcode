class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        var step = 0
        var lastStep = step
        while step < bits.count {
            if bits[step] == 1 { step += 2; lastStep = 2; }
            else { step += 1; lastStep = 1; }
        }
        return lastStep == 1
    }
}

for (i, r) in [([1, 0, 0], true), ([1, 1, 1, 0], false)] {
    let a = Solution().isOneBitCharacter(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
