//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Amina TomasMart on 11.12.2023.
//

import UIKit

class PhotoViewController: UIViewController {
    var image: UIImage?

    @IBOutlet weak var photoImageViev: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageViev.image = image
    }
    @IBAction func shareAction(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool{
                print("Успешно")
            }
        }
        present(shareController, animated: true, completion: nil)
    }
    

   
}
