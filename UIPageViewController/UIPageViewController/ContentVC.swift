//
//  ContentVC.swift
//  UIPageViewController
//
//  Created by Amina TomasMart on 21.12.2023.
//

import UIKit

class ContentVC: UIViewController {
    
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0
    var numberOfPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
    }
}
