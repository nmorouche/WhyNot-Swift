//
//  ReportUserTableViewCell.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 22/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class ReportUserTableViewCell: UITableViewCell {

    
    @IBOutlet var pictureView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
