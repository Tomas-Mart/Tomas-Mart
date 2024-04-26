import UIKit
import Foundation

func firstMethod() {
    
    print(1)
    
    DispatchQueue.main.async {
        print(2)
        
        DispatchQueue.main.async {
            print(3)
        }
        DispatchQueue.main.async {
            print(4)
        }
        DispatchQueue.global().sync {
            print(5)
        }
    }
    print(6)
    
    DispatchQueue.main.async {
        print(7)
    }
}
firstMethod()

RunLoop.main.run()



