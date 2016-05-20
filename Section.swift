//
//  Section.swift
//  HomeAlert
//
//  Created by Noah Guy on 5/9/16.
//  Copyright © 2016 Noah Guy. All rights reserved.
//

import UIKit

class Section: NSObject {
    var name = ""
    var information = ""
    var recommendation = ""
    
    init(Name: String, Info: String, Rec: String) {
        super.init()
        name = Name
        information = Info
        recommendation = Rec
    }

}
