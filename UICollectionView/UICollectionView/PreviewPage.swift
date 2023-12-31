//
//  PreviewPage.swift
//  UICollectionView
//
//  Created by Amina TomasMart on 18.12.2023.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    let imageNameArray = ["«К Элизе», Людвиг ван Бетховен",
                          "«Турецкое рондо», Вольфганг Амадей Моцарт",
                          "«Аве Мария», Франц Шуберт",
                          "«Лунная соната», Людвиг ван Бетховен",
                          "«Утро», Эдвард Григ",
                          "«Лунный свет» из «Бергамасской сюиты», Клод Дебюсси",
                          "«Фантазия-экспромт», Фредерик Шопен",
                          "«Свадебный марш», Феликс Мендельсон",
                          "«Полет шмеля», Николай Римский-Корсаков",
                          "«Лебедь», Камиль Сен-Санс"]
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtCover", for: indexPath) as! ArtCoverCell
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
        
    
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            if let indexPath = self.collectionView.indexPathsForSelectedItems{
                let detailsVC = segue.destination as! DetailVC
                detailsVC.trackTitle = imageNameArray[indexPath.count]
            }
        }
    }
}
