//
//  EventListViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class EventListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    public static let eventCellId = "EVENT_CELL_ID"
    var events: [Event]!
    
    class func newInstance(events: [Event]) -> EventListViewController{
        let elvc = EventListViewController()
        elvc.events = events
        return elvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: EventListViewController.eventCellId)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEdit)),
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(touchNewEvent))
        ]
        
        func back(sender: UIBarButtonItem) {
            // Perform your custom actions
            // ...
            // Go back to the previous ViewController
            let push = HomeViewController.newInstance()
            self.navigationController?.pushViewController(push, animated: true)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func touchEdit() {
        UIView.animate(withDuration: 0.33) {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }
    
    @objc func touchNewEvent() {
        let insert = InsertEventViewController.newInstance()
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

extension EventListViewController: UITableViewDelegate {
    
}

extension EventListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventListViewController.eventCellId, for: indexPath) as! EventTableViewCell
        let event = self.events[indexPath.row]
        cell.titleLabel.text = event.name
        cell.dateLabel.text = event.date
        cell.locationLabel.text = event.address
        let imageURL = URL(string: event.imageURL)
        let imageData = try! Data(contentsOf: imageURL!)
        cell.eventIV.image = UIImage(data: imageData)
        cell.descriptionLabel.text = event.description
        cell.priceLabel.text = "\(event.price)" + "€"
        cell.subonlyLabel.text = "\(event.sub_only)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        firstAnimation()
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        let detail = EventDetailViewController.newInstance(event: events[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    
}
extension EventListViewController : NVActivityIndicatorViewable {
    
    func firstAnimation() {
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: NSLocalizedString("HomeViewController.goToEventList.loading", comment: ""), type: .circleStrokeSpin, color: UIColor.blue, backgroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9), textColor: UIColor.red, fadeInAnimation: nil)
    }
}

