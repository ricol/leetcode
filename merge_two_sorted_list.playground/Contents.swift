public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func show()
    {
        var t: ListNode? = self
        var data = [String]()
        while let T = t
        {
            data.append("\(T.val)")
            t = t?.next
        }
        print(data.joined(separator: ","))
    }
}

class Solution
{
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
    {
        var t: ListNode?
        var h1 = l1, h2 = l2, p = t, h = t
        var bFirst = true
        while let val1 = h1?.val
        {
            p = h
            h = ListNode()
            if t == nil { t = h; p = t; }
            if let val2 = h2?.val
            {
                if val1 < val2
                {
                    h?.val = val1
                    h1 = h1?.next
                }else
                {
                    h?.val = val2
                    h2 = h2?.next
                }
            }else
            {
                h?.val = val1
                h1 = h1?.next
            }
            if !bFirst
            {
                p?.next = h
            }
            bFirst = false
        }
        
        if let _ = h2, let _ = h2?.val
        {
            p = h
            h = h2
            p?.next = h
            if t == nil { t = h; p = t; }
        }
        
        return t
    }
}

let list1 = ListNode(0, ListNode(1, ListNode(2, ListNode(3, ListNode(4, nil)))))
print("list1:")
list1.show()
let list2 = ListNode(0, ListNode(2, ListNode(2, ListNode(5, nil))))
print("list2:")
list2.show()
print("merged list:")
Solution().mergeTwoLists(list1, list2)?.show()

let list3 = ListNode(1, nil)
print("list3:")
list3.show()
let list4: ListNode? = nil
print("merged list:")
Solution().mergeTwoLists(list3, list4)?.show()
print("done.")
