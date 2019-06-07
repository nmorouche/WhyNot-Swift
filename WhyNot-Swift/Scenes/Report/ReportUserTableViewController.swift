//
//  ReportUserTableViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 22/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class ReportUserTableViewController: UITableViewController {
    
    public static let reportCellId = "REPORT_USER_CELL_ID"

    @IBOutlet var reportUserTableView: UITableView!
    
    var users: [Users]!
    
    class func newInstance(/*users: [Users]*/) -> ReportUserTableViewController{
        let elvc = ReportUserTableViewController()
        //elvc.users = users
        return elvc
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

    
}
extension ReportUserTableViewController: UITableViewDelegate {
    
}

extension ReportUserTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //EventService.default.getEvent() { (event) in
        
        let detail = EventDetailViewController.newInstance(event: events[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
        //}
    }
    
    
}



