//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Amina TomasMart on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        let photosData = setUpData()
        let title = UITextField()
        title.description = photosData.first?.title
    }
    
    func setUpData() -> [Photo] {
        CoreDataManager.shared.createPhoto(id: 1, title: "Photo_1", urlStr: "https://google.com")
        CoreDataManager.shared.createPhoto(id: 2, title: "Photo_2", urlStr: "https://google.com")
        CoreDataManager.shared.createPhoto(id: 3, title: "Photo_3", urlStr: "https://google.com")
        CoreDataManager.shared.createPhoto(id: 4, title: "Photo_4", urlStr: "https://google.com")
        CoreDataManager.shared.deletePhotos()
        
        let photos = CoreDataManager.shared.fetchPhotos()
        print(photos.first?.title)
        
        let photo = CoreDataManager.shared.fetchPhoto(id: 3)
        print(photo?.title)
        
        let phot = CoreDataManager.shared.fetchPhotos()
        return photos
    }
}

