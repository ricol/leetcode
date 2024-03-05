 // Definition for a binary tree node.
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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        func preorder(r: TreeNode, result: inout [Int]) {
            result.append(r.val)
            if r.left != nil { preorder(r: r.left!, result: &result) }
            if r.right != nil { preorder(r: r.right!, result: &result) }
        }
        var result = [Int]()
        func search(r: TreeNode) -> TreeNode? {
            if r.val == val { return r }
            if r.val < val {
                if r.right != nil { return search(r: r.right!) }
            }else {
                if r.left != nil { return search(r: r.left!) }
            }
            return nil
        }
        let r = search(r: root!)
        if let r { preorder(r: r, result: &result) }
        return r
    }
    
    func toLowerCase(_ s: String) -> String {
        var chars = Array(s)
        var targetChars = chars
        for i in 0..<chars.count {
            let c = chars[i]
            if ("A"..."Z").contains(c) {
                targetChars[i] = (Character)(c.lowercased())
            }
        }
        return String(targetChars)
    }
}


class MyHashSet {
    var data = [Int]()
    init() {
        
    }
    
    func add(_ key: Int) {
        if data.contains(key) { return }
        data.append(key)
    }
    
    func remove(_ key: Int) {
        data.removeAll { e in
            e == key
        }
    }
    
    func contains(_ key: Int) -> Bool {
        data.contains(key)
    }
}


class MyHashMap {
var data = [(Int, Int)]()
    init() {
        
    }
    
    func put(_ key: Int, _ value: Int) {
        data.removeAll { (k, v) in
            k == key
        }
        data.append((key, value))
    }
    
    func get(_ key: Int) -> Int {
        for (k, v) in data {
            if k == key { return v }
        }
        return -1
    }
    
    func remove(_ key: Int) {
        data.removeAll { (k, v) in
            k == key
        }
    }
}
