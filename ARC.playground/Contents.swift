import UIKit

func sum(a: Int, b: Int) -> Int {
    let result = a + b
    return result
}
let v = 4
for i in 0...15 {
    let result = sum(a: i, b: v)
    print(result)
}
class A {
    var age: Int
    init(age: Int = 0) {
        self.age = age
    }
    deinit {
        print("Объект уничтожен")
    }
}
func sum(a: Int, b: A) {
    b.age += a
    print(CFGetRetainCount(b))
}
func arcTest() {
    let a = A(age: 0)
    print(CFGetRetainCount(a))
    for i in 0...15 {
        let result = sum(a: i, b: v)
        print(CFGetRetainCount(a))
        let localA = a
        print(CFGetRetainCount(a))
        sum(a: 1, b: localA)
    }
    print(CFGetRetainCount(a))
}
arcTest()
print("Конец программы")
