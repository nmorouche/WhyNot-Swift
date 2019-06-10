//
//  InsertEventViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class InsertEventViewController: UIViewController {

    @IBOutlet var subonlyLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var imageTextField: UITextField!
    @IBOutlet var subonlySwitch: UISwitch!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceTextField: UITextField!
    var sub_only = false
    
    public class func newInstance() -> InsertEventViewController {
        return InsertEventViewController()
    }
    
    override func viewDidLoad() {
        sendButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        sendButton.layer.cornerRadius = 0.5 * sendButton.bounds.size.width
        sendButton.clipsToBounds = true
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        super.viewDidLoad()
        subonlySwitch.isOn = false
    }
    
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: date)
        let dateFormatted = formatter.date(from: dateString)
        let dateStringified = formatter.string(from: dateFormatted!)
        return dateStringified
    }
    
    @IBAction func createEvent(_ sender: Any) {
        guard let name = titleTextField.text,
            let description = descriptionTextView.text,
            let address = addressTextField.text,
            let image = imageTextField.text,
            let price = priceTextField.text else { return }
        let params: [String:Any] = [
            "name": name,
            "description": description,
            "date": dateFormat(date: datePicker.date),
            "address": address,
            "imageURL": image,
            "price": Int(price),
            "sub_only": self.sub_only
        ]
        EventService.default.insertEvent(params: params) { (result) in
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
    
    @IBAction func subOnlySwitch(_ sender: Any) {
        self.sub_only = subonlySwitch.isOn ? true : false
        print(self.sub_only)
    }
    
}
