//
//  DatePickerController.swift
//  HomeAlert
//
//  Created by Noah Guy on 5/11/16.
//  Copyright © 2016 Noah Guy. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {

    var sect: toDoItem!
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func savePressed(sender: UIButton) {
        sect.deadline = deadlinePicker.date
        sect.UUID = NSUUID().UUIDString
         // schedule a local notification to persist this item
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let notVC = segue.destinationViewController as! NotViewController
        notVC.sect = sect
    }
}
