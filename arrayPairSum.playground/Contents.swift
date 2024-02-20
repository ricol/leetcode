class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var sum = 0
        let n = nums.sorted()
        var i = 0
        while i < n.count {
            sum += n[i]
            i += 2
        }
        return sum
    }
}

for (i, r) in [([1,4,3,2], 4), ([6,2,6,5,1,2], 9)] {
    let a = Solution().arrayPairSum(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
