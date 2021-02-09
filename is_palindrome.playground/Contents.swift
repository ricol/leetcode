class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        
        var digits = [Int]()
        var X = x
        while X > 0
        {
            digits.append(X % 10)
            X /= 10
        }
        
        var i = 0, j = digits.count - 1
        while i != j && i < digits.count && j >= 0
        {
            if digits[i] != digits[j] { return false }
            i += 1
            j -= 1
        }
        return true
    }
}

for (input, answer) in [(0, true), (1, true), (11, true), (121, true), (-121, false), (10, false), (-101, false)]
{
    let result = Solution().isPalindrome(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(result == answer ? "pass" : "fail")")
}
