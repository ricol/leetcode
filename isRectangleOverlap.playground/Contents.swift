class Solution {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        struct Rect {
            var topLeft: Point
            var topRight: Point
            var bottomLeft: Point
            var bottomRight: Point
        }
        struct Point {
            var x: Double
            var y: Double
            
            init(x: Int, y: Int) {
                self.x = Double(x)
                self.y = Double(y)
            }
            
            init(x: Double, y: Double) {
                self.x = x
                self.y = y
            }
        }
        func getPoints(bottomLeft: Point, topRight: Point) -> Rect
        {
            return Rect(topLeft: Point(x: bottomLeft.x, y: topRight.y), topRight: topRight, bottomLeft: bottomLeft, bottomRight: Point(x: topRight.x, y: bottomLeft.y))
        }
        let r1 = getPoints(bottomLeft: Point(x: rec1[0], y: rec1[1]), topRight: Point(x: rec1[2], y: rec1[3]))
        let r2 = getPoints(bottomLeft: Point(x: rec2[0], y: rec2[1]), topRight: Point(x: rec2[2], y: rec2[3]))
        
        func pointInRectFrom(rect: Rect, inRect: Rect) -> Bool {
            for p in [rect.topLeft, rect.topRight, rect.bottomLeft, rect.bottomRight] {
                if p.x > inRect.bottomLeft.x && p.x < inRect.bottomRight.x && p.y > inRect.bottomLeft.y && p.y < inRect.topLeft.y { return true }
            }
            return false
        }
        
        func check(rect1: Rect, rect2: Rect) -> Bool {
            if rect1.topLeft.x >= rect2.topLeft.x && rect1.topRight.x <= rect2.topRight.x &&
                rect1.topLeft.y >= rect2.topLeft.y && rect1.bottomLeft.y <= rect2.bottomLeft.y { return true }
            return false
        }
        
        if pointInRectFrom(rect: r1, inRect: r2) { return true }
        if pointInRectFrom(rect: r2, inRect: r1) { return true }
        if check(rect1: r1, rect2: r2) { return true }
        if check(rect1: r2, rect2: r1) { return true }
        
        return false
    }
}

for (i, r) in [(([0, 0, 2, 2], [1, 1, 3, 3]), true),
               (([0, 0, 1, 1], [1, 0, 2, 1]), false),
               (([0, 0, 1, 1], [2, 2, 3, 3]), false),
               (([7,8,13,15], [10,8,12,20]), true),
               (([2,17,6,20], [3,8,6,20]), true),
               (([1,13,16,20], [2,12,11,18]), true),
               (([-10,-4,-3,2], [-3,-4,5,3]), false)] as [(([Int], [Int]), Bool)] {
    let a = Solution().isRectangleOverlap(i.0, i.1)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}
