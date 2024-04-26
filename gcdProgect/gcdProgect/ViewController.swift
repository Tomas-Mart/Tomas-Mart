//
//  ViewController.swift
//  gcdProgect
//
//  Created by Amina TomasMart on 09.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var button: UIButton!
    var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        button = UIButton(frame: CGRect(x: 50, y: 420, width: 300, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Установить картинку", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    
        indicator = UIActivityIndicatorView(style: .large)
        indicator.center = imageView.center
        view.addSubview(indicator)
    }
    
    @objc func buttonAction() {
        DispatchQueue.main.async {
            self.indicator.startAnimating()
        }
        
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: "https://media.istockphoto.com/id/1470236502/ru/фото/квазар-окруженный-орбитальным-аккреционным-диском-газа-сверхмассивная-звезда-с-рентгеновскими.jpg?s=612x612&w=0&k=20&c=FmK0n7XB9om4ZXEi3m8vhKipyjojL8WfIpuhpmHcaLE=") else {return}
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    self.indicator.stopAnimating()
                    self.indicator.isHidden = true
                }
            } else {
                DispatchQueue.main.async {
                    self.loadImageFromServer()
                }
            }
        }
    }
    
    func loadImageFromServer() {
        
        do {
            try fetchImage()
        } catch let error as ServerError {
            let errorMessage = "Ошибка: \(error.description)"
            displayErrorAlert(message: errorMessage)
        } catch {
            print("Произошла непредвиденная ошибка: \(error.localizedDescription)")
        }
    }

    func fetchImage() throws {
        throw ServerError.connectionError
    }

    func displayErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

enum ServerError: Error {
    case connectionError
    case notFound
    case unknownError
}

extension ServerError: CustomStringConvertible {
    var description: String {
        switch self {
            case .connectionError:
                return "Нет соединения с интернетом"
            case .notFound:
                return "Картинка не найдена"
            case .unknownError:
                return "Неизвестная ошибка"
        }
    }
}

