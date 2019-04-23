//
//  AddEventViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet var NameLabel: UITextField!
    
    @IBOutlet var DescEvent: UITextView!
    @IBOutlet var AdressLabel: UITextField!
    @IBOutlet var DatePicker: UIDatePicker!
    @IBOutlet var ImageLabel: UITextField!
    
    @IBAction func BtnCreate(_ sender: Any) {
        EventService.default.createEvent(name: NameLabel.text!, date: DatePicker.dates!, description: DescEvent.text!, adress: AdressLabel.text!, image: ImageLabel.text!) { (success) in
            if(success == 1){
                let add = AddEventViewController.newInstance()
                self.navigationController?.pushViewController(add, animated: true)
            }
        }
    }
    class func newInstance() -> AddEventViewController{
        let home = AddEventViewController( )
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
