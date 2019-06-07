//
//  ReportListViewController.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 25/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class ReportListViewController: UIViewController {
    public static let reportCellId = "REPORTCELL_ID"
    var reports: [Report]!
    
    
    @IBOutlet var reportsTableView: UITableView!
    class func newInstance(/*reports: [Report]*/) -> ReportListViewController{
        let elvc = ReportListViewController()
        //elvc.reports = reports
        return elvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reportsTableView.rowHeight = 100.0
        self.reportsTableView.delegate = self
        self.reportsTableView.dataSource = self
        self.reportsTableView.register(UINib(nibName: "ReportTableViewCell", bundle: nil), forCellReuseIdentifier: ReportListViewController.reportCellId)
        
        
        // Do any additional setup after loading the view.
    }
    
}

extension ReportListViewController: UITableViewDelegate {
    
}

extension ReportListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40/*self.reports.count*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportListViewController.reportCellId, for: indexPath) as! ReportTableViewCell
        
        /* let report = reports[indexPath.row]*/
        cell.reportLabel.text = "TEST" //report.type
        cell.descTextField.text = "efachgnkzjegbklxhncgzie,xghiehgk,hsoe" //report.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let user = UserViewController.newInstance(/*user: users[indexPath.row]*/)
        //self.navigationController?.pushViewController(user, animated: true)
    }
    
    
}
