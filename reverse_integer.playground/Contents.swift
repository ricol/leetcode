import Cocoa

class Solution {
    func reverse(_ x: Int) -> Int {
        var X = x
        var a = 0
        var digits = [Int]()
        
        while X != 0
        {
            a = X % 10
            X /= 10
            digits.append(a)
        }
        
        var result = 0
        var i = 0
        while let last = digits.last
        {
            result += last * Int(pow(Double(10), Double(i)))
            i += 1
            digits.removeLast()
        }
        
        let e = pow(Double(2), Double(31))
        return (Double(result) >= e - 1 || Double(result) <= -e) ? 0 : result
    }
}

for (input, answer) in [(123, 321), (-123, -321), (120, 21), (1534236469, 0)]
{
    let result = Solution().reverse(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(result == answer ? "passed" : "failed")")
}
