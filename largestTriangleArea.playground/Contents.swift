import Cocoa

class Solution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        var result: Double = 0
        for i in points {
            for j in points {
                for k in points {
                    if i == j || j == k || i == k { continue }
                    let p1 = Point(i: Double(i.first!), j: Double(i.last!))
                    let p2 = Point(i: Double(j.first!), j: Double(j.last!))
                    let p3 = Point(i: Double(k.first!), j: Double(k.last!))
                    let v1 = Vector(from: p1, to: p2)
                    let v2 = Vector(from: p1, to: p3)
                    let area = v1.getArea(vector: v2)
                    if area > result { result = area }
                }
            }
        }
        return result
    }
}

for (i, r) in [([[0,0],[0,1],[1,0],[0,2],[2,0]], 2),
               ([[1,0],[0,0],[0,1]], 0.5),
               ([[4,6],[6,5],[3,1]], 5.5)] {
    let a = Solution().largestTriangleArea(i)
    print("input: \(i), expect: \(r), actual: \(a) -> \((abs(r - a) < 1e-5) ? "pass" : "fail")")
}

class Vector {
    var from: Point
    var to: Point
    
    var i: Double {
        to.i - from.i
    }
    var j: Double {
        to.j - from.j
    }
    
    init(from: Point, to: Point) {
        self.from = from
        self.to = to
    }
    func magnitude() -> Double {
        to.distanceTo(point: from)
    }
    
    func getDotProduct(vector: Vector) -> Double {
        i * vector.i + j * vector.j
    }
    
    func getArea(vector: Vector) -> Double {
        0.5 * magnitude() * vector.magnitude() * pow(1 - pow(getDotProduct(vector: vector) / (magnitude() * vector.magnitude()), 2), 0.5)
    }
}
        
class Point {
    var i: Double
    var j: Double
    init(i: Double, j: Double) {
        self.i = i
        self.j = j
    }
    
    func distanceTo(point: Point) -> Double {
        pow(pow(point.i - i, 2) + pow(point.j - j, 2), 0.5)
    }
}
