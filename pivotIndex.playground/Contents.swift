class Solution {
    func pivotIndex1(_ nums: [Int]) -> Int {
        var index = -1
        var i = -1
        var sumLeft = 0
        var j = nums.count
        var sumRight = 0
        while i < j {
            if sumLeft < sumRight { 
                i += 1
                sumLeft += nums[i]
            }else if sumLeft > sumRight {
                j -= 1
                sumRight += nums[j]
            }else {
                i += 1
                j -= 1
                sumLeft += nums[i]
                if i < j { sumRight += nums[j] }
            }
        }
        return i < j ? i : -1
    }
    
    func pivotIndex(_ nums: [Int]) -> Int {
        var sumLeft = 0
        var sumRight = 0
        for index in 1..<nums.count {
            sumRight += nums[index]
        }
        if sumLeft == sumRight { return 0 }
        for index in 1..<nums.count {
            sumLeft += nums[index - 1]
            sumRight -= nums[index]
            if sumLeft == sumRight { return index }
        }
        return -1
    }
}

for (i, r) in [([1,7,3,6,5,6], 3), 
               ([1, 2, 3], -1),
               ([2, 1, -1], 0),
               ([-1,-1,-1,-1,-1,0], 2),
               ([-1,-1,0,1,1,0], 5)] {
    let a = Solution().pivotIndex(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
