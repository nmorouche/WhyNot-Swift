//
//  InsertEventViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class EventEditViewController: UIViewController {
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageTextField: UITextField!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var subonlyLabel: UILabel!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var subonlySwitch: UISwitch!
    var event: Event!
    var subonlyValue: Bool!
    
    public class func newInstance(event: Event) -> EventEditViewController {
        let eevc = EventEditViewController()
        eevc.event = event
        return eevc
    }
    
    override func viewDidLoad() {
        sendButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        sendButton.layer.cornerRadius = 0.5 * sendButton.bounds.size.width
        sendButton.clipsToBounds = true
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        self.titleTextField.text = self.event.name
        self.descriptionTextView.text = self.event.description
        self.imageTextField.text = self.event.imageURL
        self.addressTextField.text = self.event.address
        self.subonlyValue = self.event.sub_only
        subonlySwitch.isOn = subonlyValue
        self.priceTextField.text = "\(self.event.price)"
        super.viewDidLoad()
    }
    
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: date)
        let dateFormatted = formatter.date(from: dateString)
        let dateStringified = formatter.string(from: dateFormatted!)
        return dateStringified
    }
    
    
    @IBAction func onChangeSwitch(_ sender: Any) {
        self.subonlyValue = subonlySwitch.isOn ? true : false
        print(self.subonlyValue)
    }
    
    @IBAction func editEvent(_ sender: Any) {
        print("name:" + titleTextField.text!)
        print("description:" + descriptionTextView.text)
        print("address:" + addressTextField.text!)
        print("image:" + imageTextField.text!)
        print("price:" + priceTextField.text!)
        print("subonly:", subonlyValue!)
        guard let name = titleTextField.text,
            let description = descriptionTextView.text,
            let address = addressTextField.text,
            let image = imageTextField.text,
            let price = priceTextField.text,
            let subonly = subonlyValue else { return }
        let params: [String:Any] = [
            "_id": self.event._id,
            "name": name,
            "description": description,
            "address": address,
            "date": dateFormat(date: datePicker.date),
            "imageURL": image,
            "price": Int(price),
            "sub_only": subonly
        ]
        print(params)
        EventService.default.editEvent(params: params) { (result) in
            self.alertStatus()
        }
    }
    
    func alertStatus() {
        let alert = UIAlertController(title: "Insertion réussi", message: "Votre évènement a bien été enregistré", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
            EventService.default.getEvents { (events) in
                let push = EventListViewController.newInstance(events: events)
                self.navigationController?.pushViewController(push, animated: true)
            }
        })
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}
