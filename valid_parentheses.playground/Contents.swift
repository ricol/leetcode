class Solution
{
    func isValid(_ s: String) -> Bool
    {
        let mapping: [Character: Character] = [")": "(", "]": "[", "}" : "{"]
        let chars = [Character](s)
        var stack = [Character]()
        for i in (0..<chars.count)
        {
            let c = chars[i]
            if mapping.keys.contains(c)
            {
                if let expected = mapping[c], let top = stack.last, top == expected
                {
                    stack.removeLast()
                }else
                {
                    return false
                }
            }else { stack.append(c) }
        }
        return stack.isEmpty
    }
}

for (input, answer) in [("()", true), ("()[]{}", true), ("(]", false), ("([)]", false), ("{[]}", true)]
{
    let result = Solution().isValid(input)
    print("input: \(input), result: \(result), answer: \(answer) -> \(result == answer ? "pass" : "fail")")
}
