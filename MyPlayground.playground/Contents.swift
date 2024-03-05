func process<T: Comparable>(data: inout [T]) {
    for i in 0..<data.count {
        for j in stride(from: data.count - 1, to: i, by: -1) {
            if data[j - 1] > data[j] { (data[j - 1], data[j]) = (data[j], data[j - 1]) }
        }
    }
}

protocol ProcessData {
    associatedtype T
    func sort(data: inout [T])
}

class MyData {
}

extension MyData: ProcessData {
    func sort(data: inout [Int]) {
        process(data: &data)
    }
    
    typealias T = Int
}

let MAX = 10
var data: [Int] = []
(1...MAX).forEach { _ in
    data.append((1...MAX).randomElement()!)
}
print(data)
process(data: &data)
print(data)
data = []
(1...MAX).forEach { _ in
    data.append((1...MAX).randomElement()!)
}
print(data)
MyData().sort(data: &data)
print(data)

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"


let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"


print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"


protocol Shape {
    func draw() -> String
}


struct Triangle: Shape {
    var size: Int
    func draw() -> String {
       var result: [String] = []
       for length in 1...size {
           result.append(String(repeating: "*", count: length))
       }
       return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())
// ***
// **
// *

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
       return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}


func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())
// *
// **
// **
// **
// **
// *

func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}


let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *

func invalidFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape // Error: return types don't match
    }
    return FlippedShape(shape: shape) // Error: return types don't match
}

protocol Live {
    
}

class Animal: Live{
    var name: String?
    func echo() {
        print("[\(self)] animal...")
    }
}

class Person: Animal {
    override func echo() {
        print("[\(self)] say...")
    }
}

class Man: Person {
    
}

class Woman: Person {
    
}

func createPersons() -> Animal {
    let n = (1...10).randomElement()!
    if n < 5 {
        return Woman()
    }else {
        return Man()
    }
}

func process<E>(object: E) where E: Animal {
    object.echo()
}

func process1<E: Animal>(object: E) {
    object.echo()
}

func process2(object: some Live) {
    if let o = object as? Animal {
        o.echo()
    }
}

let a = createPersons()
process(object: a)
process1(object: a)
process2(object: a)

func swap(a: inout Int, b: inout Int) {
    (a, b) = (b, a)
}

var a1 = 1
var a2 = 2
swap(a: &a1, b: &a2)
print(a1)
print(a2)
