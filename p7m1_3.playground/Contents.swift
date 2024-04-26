import UIKit


var num = [19, 28, 37, 46, 55]
let count = num.count
let empty = num.isEmpty

for i in 0..<count {
    num[i] % 2 == 0 ? print("\(num[i]) -> четное") : print("\(num[i]) -> не четное")
}
for v in num {
    print(v)
}
for (i, v) in num.enumerated() {
    print(i, "->", v)
}

var arr = [Int]()
for value in 0...10 {
    arr.append(Int.random(in: 10...100))
}
print(arr)

var array = Array(stride(from: 10, through: 1, by: -1))
print(array)

var welcome = "H:e:l:l:o"
var welArr = welcome.split(separator: ":")
print(welArr, welArr.count)
print(welArr.description.lowercased())
print(welArr.description.uppercased())

// Задание 1: Сортировка чисел.

func getSortingNumbers(_ array: [Int]) -> [Int] {
    var arr = array
    let n = arr.count
    for i in 0..<n-1 {
        for j in 0..<n-i-1 {
            if arr[j]>arr[j+1] {
                let temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
    }
    return arr
}
print(getSortingNumbers([9, 8, 6, 5, 4, 3]))

// Задание 2: Проверка на палиндром.

func getCheckingPalindrome(_ string: String) -> Bool {
    var str = string
    let revers = String(str.reversed())
    if str == revers {
        return true
    } else {
        return false
    }
}
print(getCheckingPalindrome("заказ"))

// Задание 3: Сумма элементов массива.

func getSum(_ array: [Int]) -> Int {
    var arr = array
    var sum = 0
    for i in arr {
        sum += i
    }
    return sum
}
print(getSum([1, 2, 3, 4, 5]))

// Задание 4: Конвертер температур.

func getConvertsTemperature(_ celsius: Double) -> Double {
    var celsius = celsius
    var fahrenheit = (celsius * 9.0/5.0) + 32.0
    return fahrenheit
}
print(getConvertsTemperature(60))

// Задание 5: Записная книжка.

var phoneBook = [
    ["Name1" : "Amina", "Number1" : "987654321", "Email1": "amina@com"],
    ["Name2" : "Alina", "Number2" : "925784531", "Email2": "alina@com"],
    ["Name3" : "Alisa", "Number3" : "964783931", "Email3": "alisa@com"],
]

for name in phoneBook.enumerated() {
    for name in name.element {
        print(name.value)
    }
}

// Задание 6: Перестановка элементов массива.

func getRearranginElements(_ array: [Int]) -> [Int] {
    var arr = array
    var first = arr.first
    var last = arr.last
    arr[0] = last!
    arr[arr.count-1] = first!
    return arr
}
print(getRearranginElements([9, 1, 2, 3, 4, 5, 8]))

// Задание 7: Форматирование строки.

func formattingString(_ string: String) -> String {
    var str = string
    var arr = str.split(separator: " ")
    for word in arr {
        var capital = word.first!.uppercased()
        var word1 = word
        word1.removeFirst()
        word1 = capital+word1
        print(word1, terminator: " ")
    }
    return ""
}
print(formattingString("функция которая делает первую букву каждого слова в строке заглавной"))

// Задание 8: Конвертация дня недели.

func conversionDayOfWeek(_ myDay: String) {
    var days = [
        "Monday": 1,
        "Tuesday": 2,
        "Wednesday": 3,
        "Thursday": 4,
        "Friday": 5,
        "Saturday": 6,
        "Sunday": 7
    ]
    var myDay = myDay
    for (day, num) in days {
        if myDay == day {
            print("\(day) -> \(num)")
        }
    }
}
conversionDayOfWeek("Wednesday")

// Задание 9: Уникальные символы.

func getUniquCharacters(_ string: String) -> Bool {
    var symbols = [Character]()
    for symbol in string {
        if symbols.contains(symbol) {
            return false
        }
        symbols.append(symbol)
    }
    return true
}
print(getUniquCharacters("qwertyuiopasdfghjkl"))

func sort(_ input: String) -> Bool {
    return Set(input).count == input.count
}
print(sort("qwer tyuiopa sdfghjkl"))

// Задание 10: Слияние массивов.

func getMergingArrays(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    let arr = arr1 + arr2
    return arr
}
print(getMergingArrays([1, 2, 3], [4, 5, 6]))

// Задание 11: Подсчет гласных.

func getNumberOfVowelsLine(_ string: String) -> Int {
    let vowels = "eyuioa"
    var vowelsCount = 0
    for letter in string.lowercased() {
        if vowels.contains(letter) {
            vowelsCount += 1
        }
    }
    return vowelsCount
}
print(getNumberOfVowelsLine("NZXT is most known for its computer cases, but also sells motherboards, power supplies, cooling products, LED lighting, and other"))

// Задание 12: Удаление дубликатов из массива.

func removingDuplicatesFromArray(_ arr: [Int]) -> [Int] {
    var myArr = [Int]()
    var added = Set<Int>()
    for simbol in arr {
        if !added.contains(simbol) {
            myArr.append(simbol)
            added.insert(simbol)
        }
    }
    return myArr
}
print(removingDuplicatesFromArray([1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 9]))

// Задание 13: Сумма чисел до N.

func getSum(_ n: Int) -> Int {
    var arr = Array(1...n)
    var sum = 0
    for num in arr {
        sum += num
    }
    return sum
}
print(getSum(10))

func getSumNum(_ n: Int) -> Int {
    var arr = Array(1...n)
    var sum = arr.reduce(0, +)
    return sum
}
print(getSumNum(10))

// Задание 14: Длинное слово в строке.

func getLongWordLine(_ string: String) -> String {
    let str = string.components(separatedBy: .whitespacesAndNewlines)
    var longestWord = ""
    for word in str {
        if word.count > longestWord.count {
            longestWord = word
        }
    }
    return longestWord
}
print(getLongWordLine("NZXT is most known for its computer cases but also sells motherboards power supplies"))

// Задание 15: Сокращение строки.

func getShorteningString(_ myStr: String, _ n: Int) -> String {
    if myStr.count <= n {
        return myStr
    } else {
        let endIndex = myStr.index(myStr.startIndex, offsetBy: n-3)
        let newStr = myStr[..<endIndex]
        return newStr + "..."
    }
}
print(getShorteningString("NZXT is most known for its computer cases but also sells motherboards power supplies", 10))

// Задание 16: Объединение двух массивов без дубликатов.

func mergingArraysWithoutDuplicates(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var myArr1 = [Int]()
    var added1 = Set<Int>()
    var myArr2 = [Int]()
    var added2 = Set<Int>()
    for simbol in arr1 {
        if !added1.contains(simbol) {
            myArr1.append(simbol)
            added1.insert(simbol)
        }
    }
    for simbol in arr2 {
        if !added2.contains(simbol) {
            myArr2.append(simbol)
            added2.insert(simbol)
        }
    }
    let arr = myArr1 + myArr2
    var myArr = [Int]()
    var added = Set<Int>()
    for simbol in arr {
        if !added.contains(simbol) {
            myArr.append(simbol)
            added.insert(simbol)
        }
    }
    return myArr
}

print(mergingArraysWithoutDuplicates([1, 2, 3, 4, 5], [4, 5, 6, 7, 8]))

// Задание 17: Количество слов заданной длины.

func getNumberWordsOfGivenLength(_ string: String, _ n: Int) -> Int {
    let str = string.components(separatedBy: .whitespacesAndNewlines)
    var words = 0
    for word in str {
        if word.count == n {
            words += 1
        }
    }
    return words
}
print(getNumberWordsOfGivenLength("NZXT is most known for its computer cases but also sells motherboards power supplies", 3))

// Задание 19: Простой шифратор и дешифратор слов.

func encode1(_ text: String, _ shift: Int) -> String {
    let unicodeScalarA = "A".unicodeScalars.first!
    let alphabetLength = 26
    var result = ""
    
    for char in text.uppercased() {
        if let unicode = char.unicodeScalars.first {
            let shiftedUnicode = UnicodeScalar((Int(unicode.value - unicodeScalarA.value) + shift) % alphabetLength + Int(unicodeScalarA.value))
            result.append(Character(shiftedUnicode!))
        } else {
            result.append(char)
        }
    }
    return result
}
print(encode1("Amina", 1))


func encode(_ input: String) -> String {
    var encodedString = ""
    for char in input {
        if let unicode = char.unicodeScalars.first {
            let shiftedUnicode = unicode.value == 122 ? 97 : unicode.value + 1
            let shiftedChar = Character(UnicodeScalar(shiftedUnicode)!)
            encodedString.append(shiftedChar)
        }
    }
    return encodedString
}

func decode(_ input: String) -> String {
    var decodedString = ""
    for char in input {
        if let unicode = char.unicodeScalars.first {
            let shiftedUnicode = unicode.value == 97 ? 122 : unicode.value - 1
            let shiftedChar = Character(UnicodeScalar(shiftedUnicode)!)
            decodedString.append(shiftedChar)
        }
    }
    return decodedString
}
let originalWord = "Amina"
let encodedWord = encode(originalWord)
let decodedWord = decode(encodedWord)

print("Исходное слово: \(originalWord)")
print("Зашифрованное слово: \(encodedWord)")
print("Расшифрованное слово: \(decodedWord)")

// Задание 20: Конвертация времени из секунд.

func convertTimeFromSeconds(_ seconds: Int) -> String {
    return "\(seconds/3600) : \((seconds%3600)/60) : \((seconds%3600)%60)"
}
print(convertTimeFromSeconds(10000))

// Задание 18: Угадай число.

func guessTheNumber(_ userNumber: Int) {
    var userNumber = userNumber
    let randomNumber = Int.random(in: 1...100)
    if userNumber < randomNumber {
        print("Загаданное число больше")
    } else if userNumber > randomNumber {
        print("Загаданное число меньше")
    } else {
        print("Поздравляем! Вы угадали число \(randomNumber)")
    }
}
guessTheNumber(13)


