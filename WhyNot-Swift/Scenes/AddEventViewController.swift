//
//  AddEventViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var descriptionTV: UITextView!
    @IBOutlet var addressTF: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var imageTF: UITextField!
    
    @IBAction func BtnCreate(_ sender: Any) {
        EventService.default.createEvent(name: nameTF.text!, date: datePicker.date.toString(dateFormat: "YYYY-MM-dd"), description: descriptionTV.text!, address: addressTF.text!, imageURL: imageTF.text!) { (success) in
            if(success){
                let add = AddEventViewController.newInstance()
                self.navigationController?.pushViewController(add, animated: true)
            }
        }
    }
    
    class func newInstance() -> AddEventViewController {
        let home = AddEventViewController()
        return home
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
