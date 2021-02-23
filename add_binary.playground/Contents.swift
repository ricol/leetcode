class Solution
{
    func addBinary(_ a: String, _ b: String) -> String
    {
        func to_i(c: Character) -> Int
        {
            return c == "1" ? 1 : 0
        }
    
        let charsA = [Character](a)
        let charsB = [Character](b)
        var charsC = [Character]()
        var a: Int = 0
        var b: Int = 0
        var s: Int = 0
        var e: Int = 0
        var c: Int = 0
        var i = charsA.count - 1, j = charsB.count - 1
        
        while i >= 0 && j >= 0
        {
            a = to_i(c: charsA[i])
            b = to_i(c: charsB[j])
            s = a + b + e
            c = s % 2
            e = s / 2
            charsC.insert(Character("\(c)"), at: 0)
            i -= 1
            j -= 1
        }
        
        while i >= 0
        {
            a = to_i(c: charsA[i])
            s = a + e
            c = s % 2
            e = s / 2
            charsC.insert(Character("\(c)"), at: 0)
            i -= 1
        }
        
        while j >= 0
        {
            b = to_i(c: charsB[j])
            s = b + e
            c = s % 2
            e = s / 2
            charsC.insert(Character("\(c)"), at: 0)
            j -= 1
        }
        
        if e > 0 { charsC.insert(Character("\(e)"), at: 0) }
        
        return String(charsC)
    }
}

for (a, b, answer) in [("11", "1", "100"), ("1010", "1011", "10101")]
{
    let r = Solution().addBinary(a, b)
    print("checking...\(r == answer ? "pass" : "fail")")
}
