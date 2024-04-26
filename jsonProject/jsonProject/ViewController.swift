//
//  ViewController.swift
//  jsonProject
//
//  Created by Amina TomasMart on 09.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                let todoItem = try JSONDecoder().decode(Todo.self, from: data)
                DispatchQueue.main.async {
                    self?.titleLabel.text = todoItem.title
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    private func setupUI() {
        titleLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
    }
    
    struct Todo: Decodable {
        let userId: Int
        let id: Int
        let title: String
        let completed: Bool
    }
}
