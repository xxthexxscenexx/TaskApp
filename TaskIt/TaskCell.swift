//
//  TaskCell.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    //Task, date, description variables 
    @IBOutlet weak var TaskLable: UILabel!
    @IBOutlet weak var DateLable: UILabel!
    @IBOutlet weak var DescriptionLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
