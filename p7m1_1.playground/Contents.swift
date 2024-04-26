import UIKit

// 1. Создайте переменные для стоимости кофе, чая и пирожного.

var costCoffee: Int = 100
var costCake: Int = 70
var costTea: Int = 50

var countCoffee: Int = 10
var countCake: Int = 30
var countTea: Int = 20

var price: Int = (costCoffee*countCoffee)+(costCake*countCake)+(costTea*countTea)
var priceDiscount10: Int = price-(price/10)

print(priceDiscount10)

// 2. Создайте переменную для хранения текущей температуры воздуха и константу для обозначения точки замерзания воды.

var tempAir: Int = -3
let freezWater: Int = -1
var isCold: Bool = tempAir <= freezWater

print(isCold)

// 3. Создайте переменные для хранения цены товара без НДС и ставки НДС в процентах.

var priceProduct: Int = 1000
var rateVAT: Int = (priceProduct/10)*2
var priceVAT: Int = priceProduct + rateVAT
var isExpensive: Bool = priceVAT>1000

print(isExpensive)

// 4. Рассчитайте среднюю скорость движения автомобиля на основе пройденного расстояния (в километрах) и времени в пути (в часах).

let vmax: Int = 90
var t: Int = 5
var s: Int = 500
var v: Int = s/t
var isOverSpeed: Bool = v>vmax
print("Превышена ли максимально допустимая скорость? \(isOverSpeed)")

// 5. Сравните две числовые переменные: А и В.

var a: Int = 150
var b: Int = 150
var result: Bool = a <= b && a != 0

print(result)

// 6. Даны три переменные: age для возраста, minAge для минимального возраста, и testPassed для теста на права.

let minAge: Int = 18
let age: Int = 20
let testPassed: Bool = true
let canObtainLicense: Bool = age>=minAge && testPassed
print("Может ли пользователь получить водительские права? \(canObtainLicense)")

// 7. Проверьте, достаточно ли у пользователя денег для покупки товара.

let walletBalance: Int = 500
let itemPrice: Int = 450
let hasDiscountCoupon: Bool = true
let canPurchase: Bool = walletBalance>=itemPrice || hasDiscountCoupon
print("Может ли пользователь совершить покупку? \(canPurchase)")

// 8. Представьте, что вы планируете поездку на машине и хотите убедиться, что у вас есть достаточно топлива.

let distanceToDestination: Double = 300.0 // км
let currentFuel: Double = 30.0 // литры
let fuelEfficiency: Double = 10.0 // км/л
let canReachDestination: Bool = distanceToDestination/currentFuel >= fuelEfficiency
print("Можем ли мы доехать до пункта назначения без дозаправки? \(canReachDestination)")



