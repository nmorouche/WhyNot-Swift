//
//  HomeViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var goToEventList: UIButton!
    @IBOutlet var goToReportList: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        goToEventList.setTitle(NSLocalizedString("HomeViewController.goToEventList.title", comment: ""), for: .normal)
        goToReportList.setTitle(NSLocalizedString("HomeViewController.goToReportList.title", comment: ""), for: .normal)
    }

    @IBAction func goToEventList(_ sender: Any) {
        self.goToEventList.isEnabled = false
        EventService.default.getEvents { (events) in
            self.goToEventList.isEnabled = true
            let push = EventListViewController.newInstance(events: events)
            self.navigationController?.pushViewController(push, animated: true)
        }
    }

    @IBAction func goToReportList(_ sender: Any) {
        print("goToReportList")
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
