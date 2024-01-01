import UIKit

protocol Car{
    var model: String {get}
    var color: String {get}
    var buildDate: Int {get}
    var price: Int {get set}
    var accessories: [String] {get set}
}
class CarHonda: Car{
    let model = "Honda"
    let color = "Black"
    let buildDate = 2021
    var price = 1000000
    var accessories = ["tinting", "signaling", "sportsWheels"]
    
}
class CarLexus: Car{
    let model = "Lexus"
    let color = "White"
    let buildDate = 2022
    var price = 1100000
    var accessories = ["tinting", "signaling", "sportsWheels"]
}
class CarVolvo: Car{
    let model = "Volvo"
    let color = "Grey"
    let buildDate = 2023
    var price = 1200000
    var accessories = ["tinting", "signaling", "sportsWheels"]
}
extension Car{
    
    mutating func addEmergencyPack(){
        //      accessories.insert("first aid kit", at: 0)
        //      accessories.insert("fire extinguisher", at: 1)
        accessories.append("first aid kit")
        accessories.append("fire extinguisher")
    }
    mutating func makeSpecialOffer(){
        if buildDate < 2023{
            price -= price * 15 / 100
            addEmergencyPack()
            print("The price of your car is \(price) rubles и equipment is \(accessories[0]), \(accessories[1]), \(accessories[2]), \(accessories[3]), \(accessories[4]).")
        } else {
            price = price
            accessories = accessories
            print("The price of your car is \(price) rubles и equipment is \(accessories[0]), \(accessories[1]), \(accessories[2]).")
        }
    }
}
var carHonda = CarHonda()
var carLexus = CarLexus()
var carVolvo = CarVolvo()
carHonda.makeSpecialOffer()
carLexus.makeSpecialOffer()
carVolvo.makeSpecialOffer()

