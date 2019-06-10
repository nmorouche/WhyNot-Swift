//
//  HomeViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HomeViewController: UIViewController {
    
    
    class func newInstance() -> HomeViewController{
        return HomeViewController()
    }
    
    @IBOutlet var goToEventList: UIButton!
    @IBOutlet var goToReportList: UIButton!
    @IBOutlet var reportButton: UIButton!
    @IBOutlet var eventButton: UIButton!
    override func viewDidLoad() {
        eventButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        eventButton.layer.cornerRadius = 0.5 * eventButton.bounds.size.width
        eventButton.clipsToBounds = true
        self.navigationItem.setHidesBackButton(true, animated:true);
        reportButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        reportButton.layer.cornerRadius = 0.5 * reportButton.bounds.size.width
        reportButton.clipsToBounds = true
        super.viewDidLoad()
        goToEventList.setTitle(NSLocalizedString("HomeViewController.goToEventList.title", comment: ""), for: .normal)
        goToReportList.setTitle(NSLocalizedString("HomeViewController.goToReportList.title", comment: ""), for: .normal)
    }

    @IBAction func goToEventList(_ sender: Any) {
        firstAnimation()
        EventService.default.getEvents { (events) in
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            let push = EventListViewController.newInstance(events: events)
            self.navigationController?.pushViewController(push, animated: true)
        }
    }

    @IBAction func goToReportList(_ sender: Any) {
        firstAnimation()
        ReportService.default.getUsers { (users) in
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            let report = ReportUserListViewController.newInstance(users: users)
            self.navigationController?.pushViewController(report, animated: true)
        }
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

extension HomeViewController : NVActivityIndicatorViewable {
    
    func firstAnimation() {
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: NSLocalizedString("HomeViewController.goToEventList.loading", comment: ""), type: .circleStrokeSpin, color: UIColor.blue, backgroundColor:
            UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9), textColor: UIColor(red: 0.64, green: 0.40, blue: 0.45, alpha: 1), fadeInAnimation: nil)
    }
}
