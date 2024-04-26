//
//  ViewController.swift
//  Vohidova_Fatima_HW3.4
//
//  Created by Amina TomasMart on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let service = NetworkService()
    
    lazy var table: UITableView = {
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //      service.request(for configuration: appConfiguration)
        view.addSubview(table)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

