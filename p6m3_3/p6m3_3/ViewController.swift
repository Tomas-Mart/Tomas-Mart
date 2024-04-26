//
//  ViewController.swift
//  p6m3_3
//
//  Created by Amina TomasMart on 20.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let manager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getDoctors()
    }


}

