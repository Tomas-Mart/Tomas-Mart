//
//  HotelVC.swift
//  TestHotel
//
//  Created by Amina TomasMart on 23.12.2023.
//

import UIKit

class HotelVC: UIViewController {
    
    private var galleryCollectionView = GalleryCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        galleryCollectionView.set(cells: ImageModel.fetchImage())
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
