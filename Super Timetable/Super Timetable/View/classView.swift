//
//  classView.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/20.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit

//添加课程视图
class classView: UIView {
    public func addClassView(_ name:String){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = name
        label.numberOfLines = 0
        self.addSubview(label)
    }
}
