//
//  EventListTableViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit


class EventListTableViewController: UITableViewController {
    var events: [Event]!
    @IBOutlet var EventTableView: UITableView!
    
    class func newInstance(events: [Event]) -> EventListTableViewController{
        let mlvc = EventListTableViewController()
        mlvc.events = events
        return mlvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.EventTableView.delegate = self
        self.EventTableView.dataSource = self
        self.EventTableView.register(UINib(nibName: "EventListTableViewCell", bundle: nil), forCellReuseIdentifier: EventListTableViewController.eventCellId)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(add))
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func add(){
                let add = AddEventViewController.newInstance()
                self.navigationController?.pushViewController(add, animated: true)

    }

    public static let eventCellId = "EVENT_CELL_ID"
    // CODE
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        MovieService.default.getOneMovie(id:self.movies[indexPath.row].id) { (movie) in
    //            let detail = DetailMovieViewController.newInstance(movie: movie,session: self.session)
    //            self.navigationController?.pushViewController(detail, animated: true)
    //        }
    //
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EventTableView.dequeueReusableCell(withIdentifier: EventListTableViewController.eventCellId, for: indexPath) as! EventListTableViewCell
        let event = self.events[indexPath.row]
        cell.NameLabel.text = event.name
        cell.NameLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        cell.LocationLabel.text =  event.adress
        cell.LocationLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        
        let date = event.date
        let eventDate = date.toString(dateFormat: "YYYY-MM-dd")
        cell.DateLabel.text = eventDate
        cell.DateLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        var url: String=""
        url.append(event.image)
        let imageURL = URL(string: url)
        let imageData = try! Data(contentsOf: imageURL!)
        cell.ImageView.image = UIImage(data: imageData)
        
        return cell
    }
 
    
}
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}


