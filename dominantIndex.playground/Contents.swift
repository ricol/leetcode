class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        let max = nums.max()!
        var result = nums.firstIndex(of: max)!
        for i in nums {
            if max != i {
                if i != 0 && max / i < 2 { result = -1; break }
            }
        }
        return result
    }
}

for (i, r) in [([3, 6, 1, 0], 1), ([1, 2, 3, 4], -1)] {
    let a = Solution().dominantIndex(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
