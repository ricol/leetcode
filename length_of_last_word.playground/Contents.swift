class Solution
{
    func lengthOfLastWord(_ s: String) -> Int
    {
        let chars = [Character](s)
        var previous = 0
        var bAssigned = false
        var count = 0
        for i in (0..<chars.count)
        {
            if chars[i] == " "
            {
                if !bAssigned
                {
                    previous = count;
                    bAssigned = true;
                }
                count = 0
            }
            else
            {
                count += 1;
                bAssigned = false;
            }
        }
        return count == 0 ? previous : count
    }
}

for (input, answer) in [("", 0), (" ", 0), ("Hello World", 5), (" ", 0), ("a  ", 1), ("b  a  ", 1), ("  a  b  c  ", 1), ("Today is a nice day ", 3)]
{
    let r = Solution().lengthOfLastWord(input)
    print("\(input) -> \(r == answer ? "pass" : "fail")")
}
