public class ListNode
{
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public func to_array() -> [Int]
    {
        var data = [Int]()
        var temp: ListNode? = self
        repeat
        {
            data.append(temp!.val)
            temp = temp!.next
        }while temp != nil
        return data
    }
    
    static func to_list(data: [Int]) -> ListNode?
    {
        var h: ListNode?
        var p: ListNode?
        for i in data
        {
            let n = ListNode()
            n.val = i
            if p == nil { h = n; p = n; }
            else { p?.next = n; p = n }
        }
        return h
    }
}

class Solution
{
    func deleteDuplicates(_ head: ListNode?) -> ListNode?
    {
        var h = head, t = h, current: ListNode? = head == nil ? nil : head?.next
        while let c = current
        {
            if c.val != t?.val { t?.next = c; t = c; }
            current = current?.next
        }
        t?.next = nil
        return h
    }
}

for (input, answer) in [([1, 1, 2], [1, 2]), ([1, 1, 2, 3, 3], [1, 2, 3])]
{
    if let list1 = ListNode.to_list(data: input)
    {
        let data = list1.to_array()
        if let r = Solution().deleteDuplicates(list1)
        {
            let d = r.to_array()
            let correct = answer == d
            print("data: \(data), answer: \(answer), mine: \(d) -> \(correct ? "pass" : "fail")")
        }
    }
}
