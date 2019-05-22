//
//  InsertEventViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class InsertEventViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var imageTextField: UITextField!
    
    public class func newInstance() -> InsertEventViewController {
        return InsertEventViewController()
    }
    
    override func viewDidLoad() {
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
    
    @IBAction func createEvent(_ sender: Any) {
        //EventService.default.insertEvent(title: self.titleTextField.text!, date: dateFormat(date: self.datePicker.date), adress: self.adressTextField.text!, image: self.imageTextField.text!, //description: self.descriptionTextView.text!) { (code) in
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
