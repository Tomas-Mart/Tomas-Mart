//
//  ImageModel.swift
//  TestHotel
//
//  Created by Amina TomasMart on 23.12.2023.
//

import Foundation

import UIKit

struct ImageModel {
    var image: UIImage
    
    static func fetchImage() -> [ImageModel] {
        
        let firstItem = ImageModel(image: UIImage(named: "1")!)
        let secondItem = ImageModel(image: UIImage(named: "2")!)
        let thirdItem = ImageModel(image: UIImage(named: "3")!)
        
        return [firstItem, secondItem, thirdItem]
    }
}
