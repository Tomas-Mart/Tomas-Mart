//
//  ViewController.swift
//  UserDefaults
//
//  Created by Amina TomasMart on 17.04.2024.
//

import UIKit

class ViewController: UIViewController {
    var manager = SettingsManager.shared
    @IBOutlet weak var sortingSwitch: UISwitch!
    @IBOutlet weak var photoSizeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupSwitcher()
    }
    
    private func setupSwitcher() {
        sortingSwitch.isOn = manager.isSortingEnabled
        photoSizeSwitch.isOn = manager.isPhotoSizeEnabled
    }
    
    @IBAction func sortingSwitchChanged(_ sender: UISwitch) {
        manager.isSortingEnabled = sender.isOn
    }
    
    @IBAction func photoSizeSwitchChanged(_ sender: UISwitch) {
        manager.isPhotoSizeEnabled = sender.isOn
    }
}

