import UIKit
import PlaygroundSupport

//let group = DispatchGroup()
//
//func downloadImages() {
//    for i in 0..<5 {
//        group.enter()
//        print("image start - \(i)")
//        DispatchQueue.global().async {
//            sleep(1)
//            print("image end - \(i)")
//            group.leave()
//        }
//    }
//    group.notify(queue: DispatchQueue.global()) {
//        print("all images downloaded")
//    }
//}
//downloadImages()
//
//let queue1 = DispatchQueue(label: "Queue", attributes: .concurrent)
//let queue2 = DispatchQueue(label: "Queue")
//
//queue1.async {
//    print("Task 1a")
//    queue2.sync {
//        print("Task 1b")
//    }
//    print("Task 1c")
//}
//
//queue2.async {
//    print("Task 2a")
//    queue1.sync {
//        print("Task 2b")
//    }
//    print("Task 2c")
//}

var isDifferentDirections = false

public class People1 {
    func walkPast(with people: People2) {
        while(!isDifferentDirections) {
            print("People1 не может пройти")
            isDifferentDirections = true
            sleep(1)
        }
        print("People1 смог пройти")
    }
}

public class People2 {
    func walkPast(with people: People1) {
        while(!isDifferentDirections) {
            print("People2 не может пройти")
            isDifferentDirections = true
            sleep(1)
        }
        print("People2 смог пройти")
    }
}

var people1 = People1()
var people2 = People2()

let thread1 = Thread {
    people1.walkPast(with: people2)
}
let thread2 = Thread {
    people2.walkPast(with: people1)
}

thread1.start()
thread2.start()
