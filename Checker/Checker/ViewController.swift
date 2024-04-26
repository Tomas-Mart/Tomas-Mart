//
//  ViewController.swift
//  Checker
//
//  Created by Amina TomasMart on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let enteredLogin = loginField.text ?? ""
        let enteredPassword = passwordField.text ?? ""
        let isValid = Checker.shared.check(enteredLogin: enteredLogin, enteredPassword: enteredPassword)
        let message = isValid ? "Вы успешно вошли в систему" : "Неверный логин или пароль"
        showAlert(message: message)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Результат проверки", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

