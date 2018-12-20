//
//  addClassBtn.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/13.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit

//创建课程按钮
class addClassBtn: UIButton {
    public var image = UIImage()
    public var title = String()
    func createMyBtn(_ image:UIImage, andTitle title:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: self.bounds.size.height*0.1, width: self.bounds.size.width, height: self.bounds.size.width))
        imageView.image = image
        let titleLabel = UILabel(frame: CGRect(x: 0, y: self.bounds.size.height*0.7, width:self.bounds.size.width, height: self.bounds.size.height*0.2))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.textColor = UIColor.black
        titleLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
}
