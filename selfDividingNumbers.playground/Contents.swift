class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var result = [Int]()
        for l in left...right {
            var isSelfDividing = true
            var r = l
            var digit = 1
            while r > 0 {
                digit = r % 10
                if digit == 0 { isSelfDividing = false; break }
                r = r / 10
                if l % digit != 0 { isSelfDividing = false; break }
            }
            if isSelfDividing { result.append(l) }
        }
        return result
    }
}

for (i, r) in [([1, 22], [1,2,3,4,5,6,7,8,9,11,12,15,22]),
               ([47, 85], [48,55,66,77])] {
    let a = Solution().selfDividingNumbers(i.first!, i.last!)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}

func printDigit(num: Int) {
    var digits = [Int]()
    var r = num
    while r > 0 {
        digits.append(r % 10)
        r = r / 10
    }
    print(digits)
}

printDigit(num: 1332)
