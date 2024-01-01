import UIKit

var greeting = "Hello, playground"
var dict = ["a": 1, "b": 2, "c": 3]
for val in dict.values{
    print(val)
}
for key in dict.keys{
    print(key)
}
for(key, value) in dict{
    print("\(value): \(key)")
}
