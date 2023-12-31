//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Amina TomasMart on 13.12.2023.
//

import UIKit

class ViewController: UIViewController {
    var uiElements = ["UISegmentedControl", "UILabel", "UISlider", "UITextField", "UIButton", "UIDatePicker"]
    var selectedElement: String?
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        datePicker.locale = Locale(identifier: "ru")
        choiceUiElements()
        createToolBar()
    }
    func hideAllElements() {
        label.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        datePicker.isHidden = true
        segmentControl.isHidden = true
    }
    func choiceUiElements() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        textField.inputView = elementPicker
        elementPicker.backgroundColor = .black
    }
    func createToolBar() {
       let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        toolBar.tintColor = .white
        toolBar.barTintColor = .blue
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("Что-то пошло не так...")
        }
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    @IBAction func donePressed(_ sender: UIButton) {
        guard textField.text?.isEmpty == false else {return}
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Format is wrong", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            print("Format is wrong")
        } else {
            label.text = textField.text
        }
    }
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "ru")
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        doneButton.isHidden = !doneButton.isHidden
        datePicker.isHidden = !datePicker.isHidden
        segmentControl.isHidden = !segmentControl.isHidden
        if sender.isOn {
            switchLabel.text = "Отобразить все элементы"
        } else {
            switchLabel.text = "Скрыть все элементы"
        }
    }
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
            
        case 0:
            hideAllElements()
            segmentControl.isHidden = false
            
        case 1:
            hideAllElements()
            label.isHidden = false
            
        case 2:
            hideAllElements()
            slider.isHidden = false
            
        case 3:
            hideAllElements()
            
        case 4:
            hideAllElements()
            doneButton.isHidden = false
            
        case 5:
            hideAllElements()
            datePicker.isHidden = false
            
        
            
        default:
            hideAllElements()
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 25)
        pickerViewLabel.text = uiElements[row]
        return pickerViewLabel
    }
}
