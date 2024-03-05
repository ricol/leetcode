class Solution {
    func minCostClimbingStairs1(_ cost: [Int]) -> Int {
        func go(start: Int) -> Int {
            if start < cost.count {
                return [go(start: start + 1), go(start: start + 2)].min()! + cost[start]
            }else {
                return 0
            }
        }
        return [go(start: 0), go(start: 1)].min()!
    }
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var hash = [Int: Int]()
        func go(start: Int) -> Int {
            if start < cost.count {
                if hash[start] != nil { return hash[start]! }
                let value = [go(start: start + 1), go(start: start + 2)].min()! + cost[start]
                hash[start] = value
                return value
            }else {
                return 0
            }
        }
        return [go(start: 0), go(start: 1)].min()!
    }
}

for (i, r) in [([10, 15, 20], 15), ([1,100,1,1,1,100,1,1,100,1], 6)] {
    let a = Solution().minCostClimbingStairs(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
