import UIKit

func divide(a: Int, b: Int) throws -> Int {
    guard b != 0 else {
        throw NSError(domain: "На 0 делить нельзя", code: 1)
    }
    return a/b
}

do {
    
    let d = try divide(a: 15, b: 3)
    print(d)
    
    let e = try divide(a: 25, b: 5)
    print(e)
    
    let c = try divide(a: 5, b: 0)
    print(c)
    
} catch {
    print(error.localizedDescription)
}

enum AuthError: Error {
    case wrongLogin, wrongPassword, serverLost
}
extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongLogin:
            return "Неверный логин"
        case .wrongPassword:
            return "Неверный пароль"
        case .serverLost:
            return "Потеря соединения"
        }
    }
}
func auth(login: String, password: String) throws -> String {
    let trueLogin = "User"
    let truePassword = "123"
    guard login == trueLogin else {
        throw AuthError.wrongLogin
    }
    guard password == truePassword else {
        throw AuthError.wrongPassword
    }
    return "OK"
}
do {
    let answer = try auth(login: "User1", password: "1235")
    print(answer)
} catch {
    print(error.localizedDescription)
}

class Network {
    static let responses = [200, 404, 500]
    static func request() -> Int {
        return responses.randomElement()!
    }
}
enum EthernetError: Error {
    case pageNotFound, internalError(Int, String)
}
class NetworkManager {
    func userRequest(text: String) throws -> String {
        let statusCode = Network.request()
        guard statusCode != 404 else {
            throw EthernetError.pageNotFound
        }
        guard statusCode != 500 else {
            throw EthernetError.internalError(statusCode, "internal error server")
        }
        return "picture with \(text)"
    }
}
class Browser {
    let networkManager: NetworkManager
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    func getPage(request: String) {
        do {
            let result = try networkManager.userRequest(text: request)
            print(result)
        } catch EthernetError.pageNotFound {
            print("page not found")
        } catch let EthernetError.internalError(code, reason) {
            print("error with code: \(code), reason: \(reason)")
        } catch {
            print(error.localizedDescription)
        }
    }
}
let networkManager = NetworkManager()
let chrome = Browser(networkManager: networkManager)
chrome.getPage(request: "cats")
