//
//  PaidVC.swift
//  TestHotel
//
//  Created by Amina TomasMart on 23.12.2023.
//

import UIKit

class PaidVC: UIViewController {
    
    @IBOutlet weak var viewImage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewImage.frame = CGRect(x: 137, y: 213, width: 100, height: 100)
        viewImage.layer.cornerRadius = 50

    }
    @IBAction func buttonPaidAction(_ sender: Any) {
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
