//
//  DatabaseViewController.swift
//  HomeAlert
//
//  Created by Noah Guy on 4/11/16.
//  Copyright © 2016 Noah Guy. All rights reserved.
//

import UIKit

class DatabaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var sections: [toDoItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        sections.append(toDoItem(title: "Fire Extinguisher Maintenance", deadline: NSDate(), recommendation: "3 months", UUID: ""))
        sections.append(toDoItem(title: "Smoke Detector Maintenance", deadline: NSDate(), recommendation: "6 months", UUID: ""))
        // Do any additional setup after loading the view.
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myTableCell = myTableView.dequeueReusableCellWithIdentifier("firstCell", forIndexPath: indexPath)
        myTableCell.textLabel?.text = sections[indexPath.row].title
        return myTableCell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    @IBAction func addAction(sender: UIBarButtonItem) {
        let myAlert = UIAlertController(title: "Add New Event", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let maintenanceTextField = myAlert.textFields![0] as UITextField
            let recTextField = myAlert.textFields![1] as UITextField
            self.sections.append(toDoItem(title: maintenanceTextField.text!, deadline: NSDate(), recommendation: recTextField.text!, UUID: ""))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        myAlert.addAction(cancelAction)
        myAlert.addTextFieldWithConfigurationHandler { (collegeTextField) -> Void in
            collegeTextField.placeholder = "Enter Event Here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationNameTextField) -> Void in
            locationNameTextField.placeholder = "Enter Recommendation Here"
        }
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true // all cells are editable
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete { // the only editing style we'll support
            // delete the row from the data source
            var item = sections.removeAtIndex(indexPath.row) // remove TodoItem from notifications array, assign removed item to 'item'
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            toDoList.sharedInstance.removeItem(item) // delete backing property list entry and unschedule local notification (if it still exists)
            self.navigationItem.rightBarButtonItem!.enabled = true // we definitely have under 64 notifications scheduled now, make sure 'add' button is enabled
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let notVC = segue.destinationViewController as! NotViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
    }
}
