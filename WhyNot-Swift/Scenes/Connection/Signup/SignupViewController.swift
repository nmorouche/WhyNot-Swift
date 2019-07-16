//
//  SignupViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 10/06/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet var signupLabel: UILabel!
    @IBOutlet var firstnameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var firstnameTextField: UITextField!
    @IBOutlet var lastnameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        submitButton.layer.cornerRadius = 0.5 * submitButton.bounds.size.width
        submitButton.clipsToBounds = true
        setupLabels()
    }
    
    func setupLabels() {
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        passwordTextField.isSecureTextEntry = true
        signupLabel.text = NSLocalizedString("SignupViewController.signupLabel.text", comment: "")
        firstnameLabel.text = NSLocalizedString("SignupViewController.firstnameLabel.text", comment: "")
        lastnameLabel.text = NSLocalizedString("SignupViewController.lastnameLabel.text", comment: "")
        emailLabel.text = NSLocalizedString("SignupViewController.emailLabel.text", comment: "")
        passwordLabel.text = NSLocalizedString("SignupViewController.passwordLabel.text", comment: "")
        submitButton.setTitle(NSLocalizedString("SignupViewController.signupButton.title", comment: ""), for: .normal)
    }
    
    @IBAction func submit(_ sender: Any) {
        self.view.endEditing(true)
        guard let emailString = emailTextField.text,
            let firstnameString = firstnameTextField.text,
            let lastnameString = lastnameTextField.text,
            let passwordString = passwordTextField.text else { return }
        
        let params: [String:Any] = [
            "email": emailString.lowercased(),
            "firstname": firstnameString,
            "lastname": lastnameString,
            "password": passwordString
        ]
        SessionService.default.signup(params: params) { (result, status) in
            if(status == 200) {
                Session.default.setToken(token: result)
                let push = HomeViewController.newInstance()
                self.navigationController?.pushViewController(push, animated: true)
            } else {
                Toast.show(message: result, controller: self)
            }
        }
    }
    
    class func newInstance() -> SignupViewController{
        return SignupViewController()
    }
}
