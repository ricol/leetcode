
class MyQueue {
    var mainStack = [Int]()
    var otherStack = [Int]()

    init() {
        
    }
    
    func push(_ x: Int) {
        mainStack.append(x)
    }
    
    func pop() -> Int {
        while !mainStack.isEmpty {
            otherStack.append(mainStack.popLast()!)
        }
        let v = otherStack.removeLast()
        while !otherStack.isEmpty {
            mainStack.append(otherStack.popLast()!)
        }
        return v
    }
    
    func peek() -> Int {
        while !mainStack.isEmpty {
            otherStack.append(mainStack.popLast()!)
        }
        let v = otherStack.last!
        while !otherStack.isEmpty {
            mainStack.append(otherStack.popLast()!)
        }
        return v
    }
    
    func empty() -> Bool {
        mainStack.isEmpty
    }
    
    func show() {
        print("mainStack: \(mainStack)")
        print("otherStack: \(otherStack)")
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

let q = MyQueue()
q.push(1)
q.push(2)
q.push(3)
print(q.peek())
q.show()
print(q.pop())
q.show()
q.push(4)
q.show()
