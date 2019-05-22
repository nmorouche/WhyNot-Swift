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
    
    public var event: Event!
    
    class func newInstance(event: Event) -> EventDetailViewController{
        let elvc = EventDetailViewController()
        elvc.event = event
        return elvc
    }
    
    override func viewDidLoad() {
        print(self.event.name,self.event.date,self.event.address,self.nameLabel.text)
        let imageURL = URL(string: event.imageURL)
        let imageData = try! Data(contentsOf: imageURL!)
        self.imageView.image = UIImage(data: imageData)
        self.nameLabel.text = self.event.name
        self.dateLabel.text = self.event.date
        self.adressLabel.text = self.event.address
        self.descriptionField.text = self.event.description
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEdit))

        // Do any additional setup after loading the view.
    }
    
    @objc func touchEdit() {
        print(self.event)
        guard let oneEvent = self.event else{ return}
        print(oneEvent)
        let insert = EventEditViewController.newInstance(event: oneEvent)
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
