//
//  ViewController.swift
//  MySong
//
//  Created by Amina TomasMart on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var songs: [Song] = Song.getData()
    
    lazy var table: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        downloadImages()
    }
    
    func downloadImages() {
        let alert = UIAlertController(title: "Подождите", message: "Загружаем музыку", preferredStyle: .alert)
        self.present(alert, animated: true)
        let group = DispatchGroup()
        for i in 0...(songs.count-1) {
            group.enter()
            guard let url = URL(string: songs[i].imageURL) else {continue}
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    group.leave()
                }
                guard let data = data, error == nil else {return}
                self?.songs[i].imageUI = UIImage(data: data)
            }
            task.resume()
        }
        group.notify(queue: .main) {
            alert.dismiss(animated: true)
            self.table.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        var content = cell.defaultContentConfiguration()
        content.image = song.imageUI
        content.text = song.name
        content.textProperties.font = UIFont(name: "Helvetica-Bold", size: 18)!
        content.secondaryText = song.atristName
        content.secondaryTextProperties.font = UIFont(name: "Helvetica", size: 16)!
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        let vc = PlayerViewController()
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}
