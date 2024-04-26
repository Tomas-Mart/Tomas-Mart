//
//  ViewController.swift
//  UserDefaultsKeychain
//
//  Created by Amina TomasMart on 23.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var languageField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var languageText: UILabel!
    let defauts = UserDefaults.standard
    var status: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageText.text = defauts.string(forKey: "Language") ?? "Defaute"
        print(NSHomeDirectory())
    }
    
    @IBAction func createButton(_ sender: Any) {
        do {
            status = try KeychainManager.save(
                account: loginField.text ?? "base_user",
                password: (passwordField.text ?? "base_password").data(using: .utf8) ?? Data()
            )
            print(status)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func getPasswordButton(_ sender: Any) {
        do {
            let data = try KeychainManager.getPassword(for: loginField.text ?? "base_user")
            status = String(decoding: data ?? Data(), as: UTF8.self)
            print(status)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func languageSaveButton(_ sender: Any) {
        defauts.set(languageField.text ?? "defaute", forKey: "Language")
        languageText.text = languageField.text ?? "Defaute"
    }
}

