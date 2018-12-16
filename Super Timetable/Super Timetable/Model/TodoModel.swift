//
//  TodoModel.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/9.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init (id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
