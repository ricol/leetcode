class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let maxI = matrix.count
        let maxJ = matrix.first!.count
        func isValid(x: Int, y: Int) -> Bool {
            return x >= 0 && x < maxI && y >= 0 && y < maxJ
        }
        for y in 0..<maxJ {
            var i = 0
            var j = y
            var value: Int?
            while isValid(x: i, y: j) {
                let v = matrix[i][j]
                if let value, value != v { return false }
                value = v
                i += 1
                j += 1
            }
        }
        for x in 0..<maxI {
            var i = x
            var j = 0
            var value: Int?
            while isValid(x: i, y: j) {
                let v = matrix[i][j]
                if let value, value != v { return false }
                value = v
                i += 1
                j += 1
            }
        }
        return true
    }
}

for (i, r) in [([[1,2,3,4],[5,1,2,3],[9,5,1,2]], true), ([[1,2],[2,2]], false)] {
    let a = Solution().isToeplitzMatrix(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
