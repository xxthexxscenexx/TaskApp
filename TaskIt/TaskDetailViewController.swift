//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    // variables
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    var mainVC: ViewController!
    
    @IBAction func CancelButtonTapped(sender: UIBarButtonItem) {
        // make current view controller disappear from screen 
        self.navigationController?.popViewControllerAnimated(true)
        // pop current view controller of stack and display previous 
    }
    
    var detailTaskModel: taskModel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskTextField.text = detailTaskModel.task
        self.subTaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Done bar button item has been pressed 
    @IBAction func DoneBarButtonPressed(sender: UIBarButtonItem) {
        let task = taskModel(task: taskTextField.text!, subtask: subTaskTextField.text!, date: dueDatePicker.date, completed: false)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow!.row] = task
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
