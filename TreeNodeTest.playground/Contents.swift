
var items = [Int?]()
let data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let r = TreeNode.buildTree(data: data)
TreeNode.preorder(r: r) { num in
    items.append(num)
}
print("preorder: \(items)")
items.removeAll()
TreeNode.midorder(r: r) { num in
    items.append(num)
}
print("midorder: \(items)")
items.removeAll()
TreeNode.postorder(r: r) { num in
    items.append(num)
}
print("postorder: \(items)")

let levels = r?.toArrayFromTopToBottom(includeNilItem: false)
print("levels: \(levels)")
r?.show()
