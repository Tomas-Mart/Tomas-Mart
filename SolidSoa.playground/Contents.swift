import UIKit /// SOLID

// MARK: - S

class NetworkManager {
    
    func fetchData(url: URL?) {
        print("get some data")
    }
    //    func updateUI() {
    //        print("updateUI")
    //    }
}
//let networkManager = NetworkManager()
//networkManager.fetchData(url: nil)
//networkManager.updateUI()

class ViewController: UIViewController {
    let networkManager = NetworkManager()
    
    func updateUI() {
        let data = networkManager.fetchData(url: nil)
        print("updateUI")
    }
    
    override func viewDidLoad() {
        updateUI()
    }
}

// MARK: - O

//class Animal {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    func makeSound() {
//        if name == "Dog" {
//            print("гав гав")
//        } else if name == "Cat" {
//            print("мяу мяу")
//        } else if name == "Cow" {
//            print("му му")
//        }
//    }
//}
//let dog = Animal(name: "Dog")
//let cat = Animal(name: "Cat")
//let cow = Animal(name: "Cow")
//dog.makeSound()
//cat.makeSound()
//cow.makeSound()

protocol Animal {
    func makeSound()
}
class Dog: Animal {
    func makeSound() {
        print("гав гав")
    }
}
class Cat: Animal {
    func makeSound() {
        print("мяу мяу")
    }
}
class Cow: Animal {
    func makeSound() {
        print("му му")
    }
}
let dog = Dog()
let cat = Cat()
let cow = Cow()

dog.makeSound()
cat.makeSound()
cow.makeSound()

class Boy {
    var pet: Animal
    init(pet: Animal) {
        self.pet = pet
    }
    func playWithAnimal() {
        pet.makeSound()
    }
}

// MARK: - L

class Bird1 {
    func fly() {
        print("start to fly")
    }
}
class Penguin1: Bird1 {
    
    override func fly() {
        print("penguins can't fly")
    }
}
let myBird1: Bird1 = Penguin1()
myBird1.fly()

class Bird {
    func move() {
        print("start to fly")
    }
}
class Penguin: Bird {
    override func move() {
        print("start to walk")
    }
}
let myBird: Bird = Penguin()
myBird.move()

// MARK: - I

protocol Worker {
    func work()
}
protocol Eater {
    func eat()
}
class Man: Worker, Eater {
    func work() {
        print("man start to work")
    }
    func eat() {
        print("man start to eat")
    }
}
class Robot: Worker {
    func work() {
        print("robot start to work")
    }
}
let man = Man()
man.work()
man.eat()

let robot = Robot()
robot.work()

// MARK: - D

protocol LightObject {
    func turnOn()
}

class LightBulb: LightObject {
    func turnOn() {
        print("LightBulb start to light")
    }
}
class RealLamp: LightObject {
    func turnOn() {
        print("RealLamp start to light")
    }
}
class Switch {
    let bulb: LightObject
    init(bulb: LightObject) {
        self.bulb = bulb
    }
    func toggle() {
        bulb.turnOn()
    }
}
let switcher1 = Switch(bulb: LightBulb())
switcher1.toggle()
let switcher2 = Switch(bulb: RealLamp())
switcher2.toggle()


