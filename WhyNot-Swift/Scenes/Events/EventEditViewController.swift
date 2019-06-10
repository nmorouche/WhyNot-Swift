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
    var event: Event!
    
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
        print("loooool :", self.event!)
        self.titleTextField.text = self.event.name
        self.descriptionTextView.text = self.event.description
        self.imageTextField.text = self.event.imageURL
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: date)
        let dateFormatted = formatter.date(from: dateString)
        let dateStringified = formatter.string(from: dateFormatted!)
        return dateStringified
    }
    
    @IBAction func editEvent(_ sender: Any) {
        guard let name = titleTextField.text,
            let description = descriptionTextView.text,
            let address = addressTextField.text,
            let image = imageTextField.text else { return }
        let params: [String:Any] = [
            "name": name,
            "description": description,
            "date": dateFormat(date: datePicker.date),
            "address": address,
            "imageURL": image
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
}
