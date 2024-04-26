//
//  CollectionController.swift
//  p3m4_8
//
//  Created by Amina TomasMart on 19.03.2024.
//

import SwiftUI
import UIKit

struct MyCollectionView: UIViewRepresentable {
    @Binding var image: UIImage?
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell") //
        collectionView.dataSource = context.coordinator
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: MyCollectionView(image: $image))
    }
    
    class Coordinator: NSObject, UICollectionViewDataSource {
        var parent: MyCollectionView
        var images: [UIImage] = [._1, ._2, ._3, ._4, ._5, ._6, ._7, ._8, ._9, ._10]
        
        init(parent: MyCollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            images.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = UIColor.blue
            parent.image = images[indexPath.item]
            return cell
        }
    }
}
