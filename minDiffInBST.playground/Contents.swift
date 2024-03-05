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
 }

class Solution {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var min: Int?
        func assignMin(value: Int) {
            if min == nil || min! > value { min = value }
        }
        func abs(_ v: Int) -> Int {
            v > 0 ? v : -v
        }
        
        func toTheFarLeft(r: TreeNode) -> TreeNode {
            if r.left != nil { return toTheFarLeft(r: r.left!) }
            return r
        }
        
        func toTheFarRight(r: TreeNode) -> TreeNode {
            if r.right != nil { return toTheFarRight(r: r.right!) }
            return r
        }
        
        func go(r: TreeNode) {
            if r.left != nil { assignMin(value: abs(toTheFarRight(r: r.left!).val - r.val)) }
            if r.right != nil { assignMin(value: abs(toTheFarLeft(r: r.right!).val - r.val)) }
            if r.left != nil { go(r: r.left!) }
            if r.right != nil { go(r: r.right!) }
        }
        go(r: root!)
        return min == nil ? 0 : min!
    }
}

