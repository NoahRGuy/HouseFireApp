//
//  NotViewController.swift
//  HomeAlert
//
//  Created by Noah Guy on 5/9/16.
//  Copyright © 2016 Noah Guy. All rights reserved.
//

import UIKit

class NotViewController: UIViewController {
    var sect: toDoItem!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var segCont1: UISegmentedControl!
    @IBOutlet weak var segCont2: UISegmentedControl!
    @IBOutlet weak var segCont3: UISegmentedControl!
    @IBOutlet weak var segCont4: UISegmentedControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = sect.title
        recLabel.text = "Recommendation: " + sect.recommendation
        //Default options when selecting notifications (
        segCont1.selectedSegmentIndex = 0
        segCont2.selectedSegmentIndex = 1
        segCont3.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dateVC = segue.destinationViewController as! DatePickerController
        dateVC.sect = sect
    }
    @IBAction func segmentChanged1(sender: UISegmentedControl) {
        if segCont1.selectedSegmentIndex == 1{
            segCont2.selectedSegmentIndex = 0
            segCont3.selectedSegmentIndex = 0
            segCont4.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func segmentChanged2(sender: UISegmentedControl) {
        if segCont2.selectedSegmentIndex == 1{
            segCont3.selectedSegmentIndex = 0
            segCont1.selectedSegmentIndex = 0
            segCont4.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func segmentChanged3(sender: UISegmentedControl) {
        if segCont3.selectedSegmentIndex == 1{
            segCont2.selectedSegmentIndex = 0
            segCont1.selectedSegmentIndex = 0
            segCont4.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func segmentChanged4(sender: UISegmentedControl) {
        if segCont4.selectedSegmentIndex == 1{
            segCont2.selectedSegmentIndex = 0
            segCont1.selectedSegmentIndex = 0
            segCont3.selectedSegmentIndex = 0
        }
    }

    @IBAction func savePressed(sender: AnyObject) {
        if(segCont1.selectedSegmentIndex == 1){
            sect.repeatDaily = true
        }
        else if(segCont2.selectedSegmentIndex == 1){
            sect.repeatWeekly = true
        }
        else if(segCont3.selectedSegmentIndex == 1){
            sect.repeatMonthly = true
        }
        toDoList.sharedInstance.addItem(sect)
    }
}
