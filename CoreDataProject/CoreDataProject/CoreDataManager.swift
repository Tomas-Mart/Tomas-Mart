//
//  CoreDataManager.swift
//  CoreDataProject
//
//  Created by Amina TomasMart on 24.04.2024.
//

import Foundation
import CoreData
import UIKit

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    private override init(){}
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    private var context: NSManagedObjectContext {
        appDelegate.persistenContainer.viewContext
    }
    public func createPhoto(id: Int16, title: String, urlStr: String) {
        guard let photoEntityDescription = NSEntityDescription.entity(forEntityName: "Photo", in: context) else {return}
        let photo = Photo(entity: photoEntityDescription, insertInto: context)
        photo.id = id
        photo.title = title
        photo.urlStr = urlStr
        appDelegate.saveContext()
    }
    public func fetchPhotos() -> [Photo] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        do {
            return(try? context.fetch(fetchRequest) as? [Photo]) ?? []
        }
    }
    public func fetchPhoto(id: Int16) -> Photo? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            guard let photos = try? context.fetch(fetchRequest) as? [Photo] else {return nil}
            return photos.first
        }
    }
    public func updatePhoto(id: Int16, title: String? = nil, newUrlStr: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        do {
            guard let photos = try? context.fetch(fetchRequest) as? [Photo],
                  let photo = photos.first(where: { $0.id == id }) else {return}
            photo.urlStr = newUrlStr
            photo.title = title
        }
        appDelegate.saveContext()
    }
    public func deletePhotos() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        do {
            let photos = try? context.fetch(fetchRequest) as? [Photo]
            photos?.forEach{context.delete($0)}
        }
        appDelegate.saveContext()
    }
    public func deletePhoto(with id: Int16) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        do {
            guard let photos = try? context.fetch(fetchRequest) as? [Photo],
                  let photo = photos.first(where: { $0.id == id }) else {return}
            context.delete(photo)
        }
        appDelegate.saveContext()
    }
}
