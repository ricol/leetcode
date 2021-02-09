import Cocoa

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        return false
    }
}

for (input, answer) in [(121, true), (-121, false), (10, false), (-101, false)]
{
    let result = Solution().isPalindrome(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(result == answer ? "pass" : "fail")")
}
