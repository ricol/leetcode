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
    
    static func buildTree(data: [Int?]) -> TreeNode?
    {
        return nil
    }
 }

class Solution 
{
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool 
    {
        var result = false
        var hash = [Int: Bool]()
        func go(r: TreeNode?)
        {
            guard let r = r else { return }
            let other = k - r.val
            if let _ = hash[r.val] { result = true; return }
            hash[other] = true
            go(r: r.left)
            go(r: r.right)
        }
        go(r: root)
        return result
    }
}

for (i, r) in [(([5,3,6,2,4,nil,7], 9), true), (([5,3,6,2,4,nil,7], 28), false)]
{
    let (data, num) = i
    let a = Solution().findTarget(TreeNode.buildTree(data: data), num)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
