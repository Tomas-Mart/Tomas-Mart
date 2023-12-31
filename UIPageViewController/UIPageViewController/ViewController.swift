//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Amina TomasMart on 21.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
    }
    func startPresentation(){
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false{
            if let pageVC = storyboard?.instantiateViewController(
                withIdentifier: "PageVC") as? PageVC{
                present(pageVC, animated: true, completion: nil)
            }
        }
    }
}

