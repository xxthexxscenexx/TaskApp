//
//  ViewController.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Tableview variable
    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[taskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(2014, month: 05, day: 20)
        let date2 = Date.from(2014, month: 03, day: 3)
        let date3 = Date.from(2014, month: 12, day: 13)
        
        let task1 = taskModel(task: "Study French", subtask: "Verbs", date: date1, completed: false)
        let task2 = taskModel(task: "Eat Dinner", subtask: "Burgers", date: date2, completed: false)
        let taskArray = [task1, task2, taskModel(task: "Gym", subtask: "Leg Day", date: date3, completed: false)]
        
        let completedArray = [taskModel(task: "code", subtask: " ", date: date2, completed: true)]
        
        baseArray = [taskArray, completedArray]
        
        self.tableView.reloadData()
    }
    
    // Refresh information insdie of the table view
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // arranges object by date
        baseArray[0] = baseArray[0].sort {
            (taskOne:taskModel, taskTwo:taskModel) -> Bool in
            // comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let thisTask = baseArray[(indexPath?.section)!][(indexPath?.row)!]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        } else if segue.identifier == "ShowTaskAdd"{
            let addTaskVC: AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            addTaskVC.mainVC = self
        }
    }
    
    // Add a task button has been pressed
    @IBAction func AddButtonTap(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("ShowTaskAdd", sender: self)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    //Table view data source HOW MANY ITEMS IN THE ARRAY TO DISPLAY
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    // VIEW CELLS
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(indexPath.row)
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        let cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.TaskLable.text = thisTask.task
        cell.DescriptionLable.text = thisTask.subtask
        cell.DateLable.text = Date.toString(thisTask.date)
        
        return cell
    }
    
    //UI Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    // Size of Header sections
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    // Header Titles
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "To Do"
        } else {
            return "Completed"
        }
    }
    
    // switch tasks from incompelte to complete and vise versa
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0{
            let newTask = taskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: true)
            baseArray[1].append(newTask)
        }else{
            _ = taskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: false)
           //baseArray[0].append(newTask)
        }
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
    func taskDetailEdited() {
        showAlert()
    }
    
    func showAlert () {
        let alert = UIAlertController(title: "A change has been made!", message: "Congratulations", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}



