import UIKit

let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
view.backgroundColor = .systemGray

view.layer.cornerRadius = 20.0
view.layer.borderColor = UIColor.systemRed.cgColor
view.layer.borderWidth = 2.0

view.layer.shadowColor = UIColor.systemRed.cgColor
view.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
view.layer.shadowRadius = 10.0
view.layer.shadowOpacity = 0.8

