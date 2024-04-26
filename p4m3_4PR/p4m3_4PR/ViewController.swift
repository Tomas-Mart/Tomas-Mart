//
//  ViewController.swift
//  p4m3_4PR
//
//  Created by Amina TomasMart on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    var imageWidth: String = ""
    var imageHeight: String = ""
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = image.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))
        let height = image.bounds.height
        self.imageHeight = String(format: "%.0f", Double(height))
    }
    
    @IBAction func getBtn(_ sender: Any) {
        let api = "https://loremflickr.com/" + imageWidth + "/" + imageHeight
        guard let url = URL(string: api) else {fatalError("Неверный адрес")}
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        if UIApplication.shared.canOpenURL(url) {
            let taskGetPosts = session.dataTask(with: req) { data, response, error in
                guard let data = data, error == nil else {fatalError("Ошибка")}
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
            }
            taskGetPosts.resume()
        }
    }
}

