class Solution {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        var total = 0
        var primes = Set<Int>()
        (left...right).forEach { num in
            var count = 0
            var n = num
            while n > 0 {
                if n % 2 == 1 { count += 1 }
                n = n / 2
            }
            if primes.contains(count) { total += 1 }
            else {
                var isPrime = true
                if count != 1 && count != 2 && count != 3 {
                    for i in 2...(count / 2) {
                        if count % i == 0 { isPrime = false; break }
                    }
                }
                if count == 1 { isPrime = false }
                if isPrime { primes.insert(count); total += 1 }
            }
        }
        return total
    }
}

for (i, r) in [([6, 10], 4), ([10, 15], 5)] {
    let a = Solution().countPrimeSetBits(i.first!, i.last!)
    print("input: \(i), expect: \(r), actual: \(a) -> \(r == a ? "pass" : "fail")")
}

var primes = [Int]()
(2...100).forEach { num in
    var isPrime = true
    if num != 2 && num != 3 {
        for i in 2...(num / 2) {
            if num % i == 0 {
                isPrime = false
                break
            }
        }
    }
    if isPrime { primes.append(num) }
}
print(primes)
