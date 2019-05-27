//
//  ReportUserListViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 23/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class ReportUserListViewController: UIViewController {
        public static let reportCellId = "REPORT_USER_CELL_ID"
    var users: [User]!
    
    @IBOutlet var reportsTableView: UITableView!
    class func newInstance(/*users: [User]*/) -> ReportUserListViewController{
        let elvc = ReportUserListViewController()
        //elvc.users = users
        return elvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reportsTableView.delegate = self
        self.reportsTableView.dataSource = self
        self.reportsTableView.register(UINib(nibName: "ReportUserTableViewCell", bundle: nil), forCellReuseIdentifier: ReportUserListViewController.reportCellId)
        
        
        
        // Do any additional setup after loading the view.
    }
    
}

extension ReportUserListViewController: UITableViewDelegate {
    
}

extension ReportUserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40/*self.events.count*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportUserListViewController.reportCellId, for: indexPath) as! ReportUserTableViewCell
        
        /* let user = users[indexPath.row]
        let imageURL = URL(string: user.photo)
        let imageData = try! Data(contentsOf: imageURL!)
        cell.pictureView.image = UIImage(data: imageData)*/
        cell.usernameLabel.text = "TEST" //user.username
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let user = UserViewController.newInstance(/*user: users[indexPath.row]*/)
        self.navigationController?.pushViewController(user, animated: true)
    }
    
    
}
