//
//  SettingsViewController.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //variables
    
    @IBOutlet weak var variableLabel: UILabel!

    @IBOutlet weak var variableDesc: UILabel!
    let kVersionNum = "Version 1.0.0" //version number
    let desc = "This app was created by Rosemarie Day, October 23-25, 2015 as a part of HackUMass 2015. TaskIT's a sleek design containing view controllers and iOS Swift code in order to design a task list application.  "
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.variableLabel.text = kVersionNum;
        self.variableDesc.text = desc;
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneBarButtonItemPressed:"))
        
        self.navigationItem.leftBarButtonItem = doneButton
        
    }
    
    func doneBarButtonItemPressed (barButtonItem: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
