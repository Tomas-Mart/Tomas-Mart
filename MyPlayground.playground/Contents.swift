import UIKit

let q = DispatchQueue(label: "q", attributes: .concurrent)

q.sync {
    print("A")
}

q.async {
    print("B")

}

q.sync {
    print("C")
}
