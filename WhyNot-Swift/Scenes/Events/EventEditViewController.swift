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
    
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var adressTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageTextField: UITextField!
    public var event: Event!
    public class func newInstance(event: Event) -> EventEditViewController {
        let elvc = EventDetailViewController()
        elvc.event = event
        return EventEditViewController()
    }
    
    override func viewDidLoad() {
        print("loooool"+event.name)
        self.titleTextField.text = self.event.name
        self.descriptionTextView.text = self.event.description
        self.adressTextField.text = self.event.address
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
        print(self.titleTextField.text!)
        print(self.descriptionTextView.text!)
        print(self.adressTextField.text!)
        print(dateFormat(date: self.datePicker.date))
        print(self.imageTextField.text!)

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
