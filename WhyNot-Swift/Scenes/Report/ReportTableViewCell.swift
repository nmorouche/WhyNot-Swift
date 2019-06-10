//
//  ReportTableViewCell.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 25/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {

    @IBOutlet var reportLabel: UILabel!

    @IBOutlet var descLabel: UILabel!
    @IBOutlet var descTextField: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
