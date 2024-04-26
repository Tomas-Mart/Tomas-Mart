//
//  ViewController.swift
//  postsApp
//
//  Created by Amina TomasMart on 15.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var dataPosts = [Post]()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        networkManager.getPosts { [weak self] (result) in
            switch result {
            case .success(posts: let posts):
                self?.dataPosts = posts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .error(error: let error):
                
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let posts = dataPosts[indexPath.row]
        cell.textLabel?.text = posts.title
        cell.detailTextLabel?.text = posts.subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPosts.count
    }
    
}

