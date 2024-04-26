//
//  Photo+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Amina TomasMart on 24.04.2024.
//
//

import Foundation
import CoreData


extension Photo {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }
    
    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var urlStr: String?
}

extension Photo : Identifiable {
    
}
