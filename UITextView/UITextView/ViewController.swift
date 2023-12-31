//
//  ViewController.swift
//  UITextView
//
//  Created by Amina TomasMart on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hi")
        
        textView.delegate = self
        textView.isHidden = true
//        textView.alpha = 0
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 5
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        progressView.setProgress(0, animated: true)
        
        // Отслеживаем появление клавы
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // Отслеживаем скрытие клавы
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
//        UIView.animate(springDuration: 3, delay: 6, options: .curveEaseIn, animations: {
//            self.textView.alpha = 1
//        }) { (finished) in
//            self.activityIndicator.stopAnimating()
//            self.textView.isHidden = false
//            UIApplication.shared.endIgnoringInteractionEvents()
//        } Не нужен, потому что есть прогрессвью
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.progressView.progress != 1{
                self.progressView.progress += 0.1
            } else {
                self.activityIndicator.stopAnimating()
                self.textView.isHidden = false
                UIApplication.shared.endIgnoringInteractionEvents()
                self.progressView.isHidden = true
            }
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        //textView.resignFirstResponder() скрывает клаву вызванную для конкретного объекта
    }
    @objc func updateTextView(notification: Notification) {
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {return}
        if notification.name == UIResponder.keyboardWillHideNotification{
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - textViewButtonConstraint.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
}
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 60
    }
}
