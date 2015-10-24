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
    
    //Array to hold task model instances
    var taskArray : [taskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(2014, month: 05, day: 20)
        let date2 = Date.from(2014, month: 03, day: 3)
        let date3 = Date.from(2014, month: 12, day: 13)
        
        let task1 = taskModel(task: "Study French", subtask: "Verbs", date: date1)
        let task2 = taskModel(task: "Eat Dinner", subtask: "Burgers", date: date2)
        taskArray = [task1, task2, taskModel(task: "Gym", subtask: "Leg Day", date: date3)]

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
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    // Add a task button has been pressed
    @IBAction func AddButtonTap(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("ShowTaskAdd", sender: self)
    }
    
    //Table view data source HOW MANY ITEMS IN THE ARRAY TO DISPLAY
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    // VIEW CELLS
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(indexPath.row)
        
        let thisTask = taskArray[indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.TaskLable.text = thisTask.task
        cell.DescriptionLable.text = thisTask.subtask
        cell.DateLable.text = Date.toString(thisTask.date)
        
        return cell
    }
    
    //UI Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }

}

