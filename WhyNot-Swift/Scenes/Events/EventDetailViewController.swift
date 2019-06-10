//
//  EventDetailViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 21/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var adressLabel: UILabel!
    @IBOutlet var descriptionField: UITextView!
    var event: Event!
    
    class func newInstance(event: Event) -> EventDetailViewController{
        let elvc = EventDetailViewController()
        elvc.event = event
        return elvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEdit))

        // Do any additional setup after loading the view.
    }
    
    func displayData(){
        let imageURL = URL(string: event.imageURL)
        let imageData = try! Data(contentsOf: imageURL!)
        self.imageView.image = UIImage(data: imageData)
        self.nameLabel.text = self.event.name
        self.dateLabel.text = self.event.date
        self.adressLabel.text = self.event.address
        self.descriptionField.text = self.event.description
    }
    
    @objc func touchEdit() {
        print("EVENTUUUUUUU :", self.event!)
        let insert = EventEditViewController.newInstance(event: self.event!)
        self.navigationController?.pushViewController(insert, animated: true)
    }
}
