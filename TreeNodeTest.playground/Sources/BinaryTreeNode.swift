import Foundation

public class TreeNode: NSObject {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    public var val: Int?
    weak public var parent: TreeNode?
    public var left: TreeNode?
    public var right: TreeNode?
    public var level: Int = 0
    public override init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        super.init()
        self.val = val
        self.left = left
        self.right = right
        left?.parent = self
        right?.parent = self
    }
    
    public func toArrayFromTopToBottom(includeNilItem: Bool = true) -> [Int?] {
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
    
    public static func preorder(r: TreeNode?, fun: (Int?) -> Void) {
        guard let r = r else { return }
        fun(r.val)
        preorder(r: r.left, fun: fun)
        preorder(r: r.right, fun: fun)
    }
    
    public static func midorder(r: TreeNode?, fun: (Int?) -> Void) {
        guard let r = r else { return }
        preorder(r: r.left, fun: fun)
        fun(r.val)
        preorder(r: r.right, fun: fun)
    }
    
    public static func postorder(r: TreeNode?, fun: (Int?) -> Void) {
        guard let r = r else { return }
        preorder(r: r.left, fun: fun)
        preorder(r: r.right, fun: fun)
        fun(r.val)
    }
    
    public static func buildTree(data: [Int?], pos: Int = 0) -> TreeNode? {
        var r: TreeNode? = nil
        guard pos >= 0, pos < data.count, let val = data[pos] else { return r }
        if pos < data.count {
            r = TreeNode(val)
            r?.left = buildTree(data: data, pos: 2 * pos + 1)
            r?.left?.parent = r
            r?.right = buildTree(data: data, pos: 2 * pos + 2)
            r?.right?.parent = r
        }
        return r
    }
    
    public func show() {
        var maxLvl = 0
        var data = [(TreeNode?, Int)]()
        var queue = [(TreeNode?, Int)]()
        queue.append((self, 0))
        while !queue.isEmpty {
            let (node, lvl) = queue.removeFirst()
            node?.level = lvl
            if lvl > maxLvl { maxLvl = lvl }
            if let node = node {
                data.append((node, lvl))
                queue.append((node.left, lvl + 1))
                queue.append((node.right, lvl + 1))
            }else {
                data.append((nil, lvl))
            }
        }
        
        func spaces(num: Int) -> String {
            var data = [Character]()
            (0...num).forEach { _ in
                data.append("\t")
            }
            return String(data)
        }
        
        var levelHash = [Int: [TreeNode?]]()
        data.forEach { node, level in
            var array = levelHash[level] ?? [TreeNode?]()
            array.append(node)
            levelHash[level] = array
        }
        
        var s = ""
        for level in levelHash.keys.sorted() {
            s += "\n"
            let nodes = levelHash[level] ?? [TreeNode?]()
            nodes.forEach { n in
                let v = n?.val
                s += spaces(num: (maxLvl - level) * 2) + (v == nil ? "?" : "\(v!)")
            }
        }
        print(s)
        return
        /*
        print("new format:")
        var display = [String]()
        
        func getTabs(num: Int) -> String {
            var s = ""
            (-10..<num).forEach { _ in
                s += "\t"
            }
            return s
        }
        
        var displayForNodes = [TreeNode: Int]()
        func process(nodes: [TreeNode?]) {
            if nodes.count <= 0 { return }
            var parents = [TreeNode?]()
            var s = ""
            for p in nodes {
                if let p = p {
                    if let l = p.left, let v = displayForNodes[l] {
                        s += getTabs(num: v + 1) + "\(p.val!)"
                    }else if let r = p.right, let v = displayForNodes[r] {
                        s += getTabs(num: v - 1) + "\(p.val!)"
                    }
                }
                parents.append(p?.parent)
            }
            display.insert(s, at: 0)
            process(nodes: parents)
        }
        
        for level in levelHash.keys.sorted().reversed()
        {
            var parents = [TreeNode?]()
            let nodes = levelHash[level] ?? [TreeNode?]()
            var s = ""
            for n in nodes {
                parents.append(n?.parent)
                if let n = n {
                    displayForNodes[n] = 1
                    s += "\t" + "\(n.val!)"
                }
            }
            display.insert(s, at: 0)
            process(nodes: parents)
            break
        }
        
        print(display)
        print("Tree...")
        print(display.joined(separator: "\n"))
         */
    }
}
