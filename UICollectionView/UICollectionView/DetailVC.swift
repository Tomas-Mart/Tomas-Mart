//
//  DetailVC.swift
//  UICollectionView
//
//  Created by Amina TomasMart on 18.12.2023.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    var trackTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: trackTitle)
        label.text = trackTitle
        label.numberOfLines = 0
    }
}
