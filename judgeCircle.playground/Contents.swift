class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0
        var y = 0
        moves.forEach { move in
            if move == "U" {
                y += 1
            }else if move == "D" {
                y -= 1
            }else if move == "L" {
                x -= 1
            }else if move == "R" {
                x += 1
            }
        }
        return x == 0 && y == 0
    }
}

for (i, r) in [("UD", true), ("LL", false)]
{
    let a = Solution().judgeCircle(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
