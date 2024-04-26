//
//  SettingsViewController.swift
//  p3m5_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    private let ntcManager = NTCManager.shared
    
    private lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.axis = .horizontal
        $0.spacing = 0
        $0.addArrangedSubview(textLabel)
        $0.addArrangedSubview(switchLabel)
        return $0
    }(UIStackView())
    
    private lazy var textLabel: UILabel = {
        $0.text = "Notifications"
        return $0
    }(UILabel())
    
    private lazy var switchLabel: UISwitch = {
        if userDefaults.bool(forKey: "ntIsOn") {
            $0.isOn = true
        } else {
            $0.isOn = false
        }
        return $0
    }(UISwitch(frame: .zero, primaryAction: action))
    
    private lazy var action = UIAction { action in
        if let switchLabel = action.sender as? UISwitch {
            if switchLabel.isOn {
                self.ntcManager.notificationAuth()
            } else {
                self.ntcManager.outNotification()
            }
            self.userDefaults.set(switchLabel.isOn, forKey: "ntIsOn")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Settings"
        view.addSubview(hStack)
        addConstraints()
    }
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hStack.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
