//
//  TrackList.swift
//  UITableView и UIImage
//
//  Created by Amina TomasMart on 18.12.2023.
//

import UIKit

class TrackList: UITableViewController {
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let detailsVC = segue.destination as! DetailVC
                detailsVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }
}
