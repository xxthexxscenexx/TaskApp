//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    //variables
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var mainVC: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        var task = taskModel(task: taskTextField.text!, subtask: subtaskTextField.text!, date: dueDatePicker.date, completed: false)
        mainVC.baseArray[0].append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
