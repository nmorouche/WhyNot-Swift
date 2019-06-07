//
//  UserViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 25/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdateLabel: UILabel!
    @IBOutlet var sexeLabel: UILabel!
    @IBOutlet var bioTextField: UITextView!
    
    var user: User!
    
    class func newInstance(/*user: User*/) -> UserViewController{
        let elvc = UserViewController()
        //elvc.user = user
        return elvc
    }
    
    
    override func viewDidLoad() {
        self.nameLabel.text = "Alpheonix"  //self.user.username
        self.birthdateLabel.text = "08/09/1999"  //self.user.birthdate
        self.sexeLabel.text = "male" //self.user.sexe
        self.bioTextField.text = "ceci est une bio" // self.user.bio
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(touchEdit))
        
       /* let imageURL = URL(string: user.photo)
        let imageData = try! Data(contentsOf: imageURL!)
        self.imageView.image = UIImage(data: imageData)*/
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func banButton(_ sender: Any) {
       // ReportService.default.banUser(id: "1") { (error) in
            //if(error != nil){
                //ReportService.default.getUsers { (users) in
                let report = ReportUserListViewController.newInstance()
                self.navigationController?.pushViewController(report, animated: true)
                //}
            //}
       // }
    }
    
    @IBAction func checkButton(_ sender: Any) {
        // ReportService.default.checkUser(id: "1") { (error) in
        //if(error != nil){
        //ReportService.default.getUsers { (users) in
        let report = ReportUserListViewController.newInstance()
        self.navigationController?.pushViewController(report, animated: true)
        //}
        //}
        // }

    }
    @objc func touchEdit() {
        
        let insert = ReportListViewController.newInstance()
        self.navigationController?.pushViewController(insert, animated: true)
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
