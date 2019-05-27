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
    @IBOutlet var adressTextField: UITextField!
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
        //EventService.default.editEvent(title: self.titleTextField.text!, date: dateFormat(date: self.datePicker.date), adress: self.adressTextField.text!, image: self.imageTextField.text!, //description: self.descriptionTextView.text!) { (code) in
            //if (code == "200"){
                EventService.default.getEvents(completion: { (event) in
                    let list = EventListViewController.newInstance(events: event)
                    self.navigationController?.pushViewController(list, animated: true)
                })
                
            //}
       // }
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
