//
//  ViewController.swift
//  fileManager
//
//  Created by Amina TomasMart on 17.04.2024.
//

import UIKit

class ViewController: UIViewController {
    let manager = FileManager.default
    @IBOutlet weak var fileNameField: UITextField!
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        print(NSHomeDirectory())
    }
    
    @IBAction func createButtonTap(_ sender: Any) {
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        print(url.path)
        let fileName = (fileNameField.text ?? "log") + ".txt"
        let fileURL = url.appendingPathComponent(fileName)
        let stringData = field.text
        let data = stringData?.data(using: .utf8)
        manager.createFile(atPath: fileURL.path, contents: data, attributes: [FileAttributeKey.creationDate : Date()])
    }
    
    @IBAction func deleteButtonTap(_ sender: Any) {
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileName = (fileNameField.text ?? "log") + ".txt"
        let fileURL = url.appendingPathComponent(fileName)
        if manager.fileExists(atPath: fileURL.path) {
            do {
                try manager.removeItem(atPath: fileURL.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

