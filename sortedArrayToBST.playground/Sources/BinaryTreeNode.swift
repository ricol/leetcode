//
//  BinaryTreeNode.swift
//  
//
//  Created by Ricol Wang on 2024/1/30.
//

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
    
    func toArrayFromTopToBottom(includeNilItem: Bool = true) -> [Int?] {
        var data = [Int?]()
        var queue = [TreeNode?]()
        queue.append(self)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let node = node {
                data.append(node.val)
                if includeNilItem {
                    queue.append(node.left)
                    queue.append(node.right)
                }else {
                    if let l = node.left { queue.append(l) }
                    if let r = node.right { queue.append(r) }
                }
            }else {
                if includeNilItem {
                    data.append(nil)
                }
            }
        }
        return data
    }
    
    func preorder(r: TreeNode?) {
        guard let r = r else { return }
        print(r.val)
        preorder(r: r.left)
        preorder(r: r.right)
    }
    
    func midorder(r: TreeNode?) {
        guard let r = r else { return }
        preorder(r: r.left)
        print(r.val)
        preorder(r: r.right)
    }
    
    func postorder(r: TreeNode?) {
        guard let r = r else { return }
        preorder(r: r.left)
        preorder(r: r.right)
        print(r.val)
    }
    
    static func buildTree(data: [Int?], pos: Int = 0) -> TreeNode? {
        var r: TreeNode? = nil
        guard let val = data[pos] else { return r }
        if pos < data.count {
            r = TreeNode(val)
            r?.left = buildTree(data: data, pos: 2 * pos + 1)
            r?.right = buildTree(data: data, pos: 2 * pos + 2)
        }
        return r
    }
}
