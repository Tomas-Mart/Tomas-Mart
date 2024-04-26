//
//  ViewController.swift
//  sessionDelegate
//
//  Created by Amina TomasMart on 07.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressView.progress = 0
    }
    
    @IBAction func downloadButtonTap(_ sender: Any) {
        let urlStr = "https://c4.wallpaperflare.com/wallpaper/827/176/890/starcraft-ii-starcraft-james-raynor-cat-wallpaper-preview.jpg"
        guard let url = URL(string: urlStr) else {return}
     
        let session = URLSession.init(configuration: .default, delegate: self, delegateQueue: .main)
        session.downloadTask(with: url).resume()
    }
}

extension ViewController: URLSessionDownloadDelegate {
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let data = try? Data(contentsOf: location)
        imageView.image = UIImage(data: data!)
        imageView.contentMode = .scaleAspectFill
        progressLabel.isHidden = true
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        var progress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async { [weak self] in
            self?.progressView.progress = progress
            self?.progressLabel.text = "\(progress*100)%"
        }
    }
}

//        URLSession.shared.downloadTask(with: url) { [weak self] urlData, response, error in
//            if let urlData = urlData, error == nil {
//                print(urlData)
//                let data = try? Data(contentsOf: urlData)
//                DispatchQueue.main.sync {
//                    self?.image.image = UIImage(data: data!)
//                }
//            } else {
//                print(error?.localizedDescription)
//            }
//        } .resume()

