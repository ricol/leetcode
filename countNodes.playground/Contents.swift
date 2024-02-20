public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
    }
    
    func toArray() -> [Int?] {
        var data = [Int]()
        var queue = [TreeNode]()
        queue.append(self)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            data.append(node.val)
            if let l = node.left { queue.append(l) }
            if let r = node.right { queue.append(r) }
        }
        return data
    }
}

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        var data = [Int]()
        var queue = [TreeNode]()
        queue.append(r)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            data.append(node.val)
            if let l = node.left { queue.append(l) }
            if let r = node.right { queue.append(r) }
        }
        return data.count
    }
}

for (i, r) in [([1,2,3,4,5,6], 6), ([], 0), ([1], 1)] {
//    let a = Solution().countNodes(i)
//    print("input: \(i), expect: \(r), acutal: \(a) -> \(r == a ? "pass" : "fail")")
}
