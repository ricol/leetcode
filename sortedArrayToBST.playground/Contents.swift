
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func getMaximumOfLeft(r: TreeNode) -> TreeNode {
            var n = r
            if r.left != nil { n = r.left!
                while n.right != nil { n = n.right! }
            }
            return n
        }
        func getMinimumOfRight(r: TreeNode) -> TreeNode {
            var n = r
            if r.right != nil { n = r.right!
                while n.left != nil { n = n.left! }
            }
            return n
        }
        func getTargetNode(r: TreeNode, for val: Int) -> TreeNode? {
            if val == r.val { return r }
            if val < r.val {
                if let l = r.left {
                    return getTargetNode(r: l, for: val)
                }else { return r }
            }else if val > r.val {
                if let r = r.right {
                    return getTargetNode(r: r, for: val)
                }else { return r }
            }
            return nil
        }
        var i = 0
        var r: TreeNode? = nil
        var node = TreeNode(nums[i])
        r = node
        while i < nums.count {
            i += 1
            let val = nums[i]
            let n = TreeNode(val)
            if let target = getTargetNode(r: r!, for: val) {
                if val >= target.val {
                    let m = getMinimumOfRight(r: target)
                    m.right = n
                    m.left = target
                }else if val < target.val {
                    let m = getMaximumOfLeft(r: target)
                    m.right = target
                    m.left = n
                }
            }
        }
        return r
    }
}

for (i, r) in [([-10,-3,0,5,9], [0,-3,9,-10,nil,5]), ([1,3], [3, 1])]
{
    let a = Solution().sortedArrayToBST(i)?.toArray()
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
