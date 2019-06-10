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
    
    class func newInstance(user: User) -> UserViewController{
        let elvc = UserViewController()
        elvc.user = user
        return elvc
    }
    
    
    override func viewDidLoad() {
        self.nameLabel.text = self.user.username
        self.birthdateLabel.text = self.user.birthdate
        self.sexeLabel.text = self.user.sexe
        self.bioTextField.text = self.user.bio
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(touchEdit))
        
        let imageURL = URL(string: user.photo)
        let imageData = try! Data(contentsOf: imageURL!)
        self.imageView.image = UIImage(data: imageData)
        
        super.viewDidLoad()

    }
    
    @IBAction func banButton(_ sender: Any) {
        ReportService.default.banUser(id: user.id) { (error) in
            print(error)
            if(error == 200){
                let report = HomeViewController.newInstance()
                self.navigationController?.pushViewController(report, animated: true)
                
            }
        }
    }
    
    
    @objc func touchEdit() {
        ReportService.default.getReports(id: user.id) { (report) in
            let insert = ReportListViewController.newInstance(reports: report)
            self.navigationController?.pushViewController(insert, animated: true)
        }
        
        
        
    }

}
