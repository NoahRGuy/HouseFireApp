//
//  toDoItem.swift
//  HomeAlert
//
//  Created by Noah Guy on 5/11/16.
//  Copyright © 2016 Noah Guy. All rights reserved.
//

import Foundation

struct toDoItem{
    var title: String
    var deadline: NSDate
    var recommendation: String
    var UUID: String
    var repeatDaily: Bool
    var repeatWeekly: Bool
    var repeatMonthly: Bool
    
    init(title: String, deadline: NSDate, recommendation: String, UUID: String){
        self.title = title
        self.deadline = deadline
        self.recommendation = recommendation
        self.UUID = UUID
        self.repeatDaily = false
        self.repeatWeekly = false
        self.repeatMonthly = false
    }
    var overdue: Bool{
        return(NSDate().compare(self.deadline) == NSComparisonResult.OrderedAscending)
    }
    
}