import UIKit

// 1. Задание: Проверка булевых условий.

let isExpensive: Bool = true
let isBeautiful: Bool = true
if isExpensive && isBeautiful {
    print("Оба условия выполняются")
} else if isExpensive || isBeautiful {
    print("Хотя бы одно из условий выполняется")
} else {
    print("Ни одно из условий не выполняется")
}

// 2. Задание: Проверка четности числа.

let number: Int = 30
switch number {
case let x where x%2 == 0:
    print("Число четное")
default:
    print("Число нечетное")
}

// 3. Задание: Доступ на мероприятие.

let isAdult: Bool = true
let isHasTicket: Bool = true
let canToEvent = isAdult && isHasTicket ? "Добро пожаловать!" : "Доступ запрещен"
print(canToEvent)

// 4. Задание: Работа со строками.

var firstName: String = "Ксения"
var lastName: String = "Томас-Март"
var surName: String = "Андреевна"
var fullName: String = firstName + " " + lastName + " " + surName
print(fullName)

// 5. Задание: Операции с числами.

var num1: Float = 33.0
var num2: Float = 25.0
var sum: Float = num1 + num2
var difference: Float = num1 - num2
var product: Float = num1 * num2
var quotient: Float = num1 / num2
print("""
Сумма чисел равна \(sum)
Разность чисел равна \(difference)
Произведение чисел равно \(product)
Частное чисел равно \(quotient)
""")

// 6. Задание: Точность чисел с плавающей запятой.

var a: Double = 9.876543218765432198765 - 0.00000000000001
var b: Float = 9.876543218765432198765 - 0.00000000000001
print("Double = \(a), а Float = \(b)")

// 7. Задание: Условные операторы и возраст.

var age: Int = 35
var isAdult1 = age >= 18 ? "Вы cовершеннолетний" : "Вы не cовершеннолетний"
print(isAdult1)

// 8. Задание: Работа с циклами.

for i in 1...100 {
    if i > 10 {break}
    print(i, "->", i*i)
}

for i in 50...100 where i%2 == 0 {
    print("\(i) - четное число")
}

for i in 50...100 where i%2 != 0 {
    print("\(i) - нечетное число")
}

// 8. Задание: Логическое "И" (&&).

let isWarm: Bool = true
let isDry: Bool = false
var goodWeather = isWarm && isDry ? "Оба условия выполняются" : "Не все условия выполняются"
print(goodWeather)

// 9. Задание: Логическое "ИЛИ" (||).

let isCold: Bool = true
let isDamp: Bool = false
var badWeather = isCold || isDamp ? "Хотя бы одно из условий выполняется" : "Оба условия ложны"
print(badWeather)

// 10. Задание: Логическое отрицание (!).

let num: Int = 80
num%2 != 0 ? print("Число нечетное") : print("Число четное")

// 11. Задание: Комбинация операторов.

let isAdult2: Bool = false
let isHasTicket2: Bool = false
let canToEvent2 = isAdult2 && isHasTicket2
let cantToEvent2 = isAdult2 || isHasTicket2
if canToEvent2 {
    print("Добро пожаловать!")
} else if cantToEvent2 {
    print("Доступ запрещен")
} else {
    print("Доступ запрещен")
}

// 12. Задание: Четность числа.

func checkParityNumber(_ a: Int) -> Bool {
    guard a % 2 == 0 else {return false}
    return true
}
print(checkParityNumber(500))

//// 13. Задание: Делимость на 3.

func checkNotParityNumber(_ a: Int) -> Bool {
    guard a % 3 == 0 else {return false}
    return true
}
print(checkNotParityNumber(123))

// 14. Задание: Массив из 100 чисел.

var arr = Array(1...100)
arr = arr.filter{$0 % 2 != 0 && $0 % 3 == 0}
print(arr)

// 15. Задание: Числа Фибоначчи Fn=Fn-1 + Fn-2.

func fibArr(_ n: Int) -> [Int] {
    var fib: [Int] = [1, 1]
    (2...n).forEach { i in
        fib.append(fib[i - 1] + fib[i - 2])
    }
    return fib
}
print(fibArr(50))

// 16. Задание: Факториал числа.

func facNum(_ N: Int) -> Int {
    if N < 1 || N > 20 {
        return 1
    } else {
        return N * facNum(N - 1)
    }
}
print(facNum(20))

// 17. Задание: Простой калькулятор.

func getResult1(_ a: Double, _ b: Double,
                _ operation: (_ lhs: Double, _ rhs: Double)
                -> Double) -> Double {operation(a, b)}
print(getResult1(33, 33, *))

enum Operation {
    case add, sub, mul, div
}
enum ResultError: Error {
    case divisionByZero
}
func getResult2(_ a: Int, _ b: Int, _ operation: Operation) throws -> Int {
    switch  operation {
    case .add :
        return a + b
    case .sub :
        return a - b
    case .mul :
        return a * b
    case .div :
        if b != 0 {
            return a / b
        } else {
            throw ResultError.divisionByZero
        }
    }
}
do {
    print(try getResult2(9, 9, .mul))
} catch {
    print(error.localizedDescription)
}

// 18. Задание: Длина строки.

func determineLengthString(_ string: String) -> Int {
    let str = string
    let length = str.count
    return length
}
print(determineLengthString("При передаче строки в функцию, она вернет количество символов в этой строке"))

// 19. Задание: Максимум из трех чисел.

func getMax(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a>b && a>c {
        return a
    } else if b>a && b>c {
        return b
    } else {
        return c
    }
}
print(getMax(30, 50, 70))

// 20. Задание: Реверс строки.

func reverseLine(_ string: String) -> String {
    var str = string
    let character = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
    var reverse = String(str.trimmingCharacters(in: character).reversed())
    return reverse
}
print(reverseLine("При передаче строки в функцию, она вернет эту строку в обратном порядке"))

// 21. Задание: Подсчет слов в строке.

func getWordsCount(_ string: String) -> Int {
    let str = string
    let character = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
    let components = str.components(separatedBy: character)
    var words = components.filter{!$0.isEmpty}
    return words.count
}
print(getWordsCount("При передаче строки в функцию, она вернет количество слов в этой строке"))


