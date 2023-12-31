//
//  ViewController.swift
//  UILabel and UIButton
//
//  Created by Amina TomasMart on 12.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet var actionButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textColor = UIColor.red
        
        button.isHidden = true
        for button in actionButtons{
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .green
        }
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
    }
    @IBAction func pressedButton(_ sender: UIButton) {
        //        if label.isHidden{
        //            label.isHidden = false
        //            label.text = "Hello, World!"
        //            button.setTitle("Clear", for: .normal)
        //            button.setTitleColor(.white, for: .normal)
        //            button.backgroundColor = .red
        //        } else {
        //            label.isHidden = true
        //            button.setTitle("Get result", for: .normal)
        //            button.setTitleColor(.blue, for: .normal)
        //            button.backgroundColor = .green
        //        }
        label.isHidden = false
        button.isHidden = false
        if sender.tag == 0{
            label.text = "Hello, World!"
            label.textColor = .red
        } else if sender.tag == 1{
            label.text = "Hi there!"
            label.textColor = .blue
        } else if sender.tag == 2{
            label.isHidden = true
            button.isHidden = true
        }
    }
}

