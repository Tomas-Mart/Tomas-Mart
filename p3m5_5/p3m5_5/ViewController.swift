//
//  ViewController.swift
//  p3m5_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        $0.center = view.center
        $0.setTitle("Settings", for: .normal)
        $0.setTitleColor(.red, for: .highlighted)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 50)), primaryAction: action))
    
    private lazy var action = UIAction { _ in
        let vc = SettingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(button)
    }
}

