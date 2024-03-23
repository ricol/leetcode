class Solution {
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        var result = image
        let maxI = image.count - 1
        let maxJ = image.first!.count - 1
        for i in 0...maxI {
            for j in 0...(maxJ / 2) {
                (result[i][j], result[i][maxJ - j]) = (result[i][maxJ - j], result[i][j])
            }
        }
        for i in 0...maxI {
            for j in 0...maxJ {
                result[i][j] = result[i][j] == 1 ? 0 : 1
            }
        }
        return result
    }
}

for (i, r) in [([[1,1,0],[1,0,1],[0,0,0]], [[1,0,0],[0,1,0],[1,1,1]]),
([[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]], [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]])] {
    let a = Solution().flipAndInvertImage(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
