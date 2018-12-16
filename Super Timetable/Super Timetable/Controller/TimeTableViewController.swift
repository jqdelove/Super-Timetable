//
//  TimeTableViewController.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/12.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

class TimeTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "第2周"
        let backImageView : UIImageView = UIImageView()
        backImageView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        backImageView.image = UIImage.init(named: "ios用图3")
        self.view.addSubview(backImageView)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setNavItem()
        initHeaderView()
    }
    
    func setNavItem() {
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(TimeTableViewController.leftButtonClicked))
        self.navigationItem.rightBarButtonItem = leftItem
    }
    
    @objc func leftButtonClicked(){
        let sb = UIStoryboard.init(name: "Main", bundle:Bundle.main)
        let addVC = sb.instantiateViewController(withIdentifier: "addVC")
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    func initHeaderView() {
        let date = NSDate()
        let timeFormatterMonth = DateFormatter()
        timeFormatterMonth.dateFormat = "MM"
        let strNowMonth = timeFormatterMonth.string(from: date as Date) as String
        let month = strNowMonth + "\n" + "月"
        let timeFormatterDay = DateFormatter()
        timeFormatterDay.dateFormat = "dd"
        let strNowDay = timeFormatterDay.string(from: date as Date) as String
        let day = strNowDay + "日"
        let day1 = Int(strNowDay)! - 3
        let day2 = Int(strNowDay)! - 2
        let day3 = Int(strNowDay)! - 1
        let day4 = Int(strNowDay)! + 1
        let day5 = Int(strNowDay)! + 2
        let day6 = Int(strNowDay)! + 3
        let Day = "日"
        let str1 = "\n\(day1)\(Day)"
        let str2 = "\n\(day2)\(Day)"
        let str3 = "\n\(day3)\(Day)"
        let str4 = "\n\(day4)\(Day)"
        let str5 = "\n\(day5)\(Day)"
        let str6 = "\n\(day6)\(Day)"
        var weekArr : [String] = [month,"周一"+str1,"周二"+str2,"周三"+str3,"周四"+day,"周五"+str4,"周六"+str5,"周日"+str6]
        var nowIndex : CGFloat = 0.0
        let width : CGFloat = SCREEN_WIDTH/8.0
        for item in 0...7 {
            let headLabel : UILabel = UILabel(frame: CGRect(x: nowIndex, y: 116, width: width, height: SCREEN_HEIGHT*0.08))
            headLabel.adjustsFontSizeToFitWidth = true
            headLabel.numberOfLines = 0
            headLabel.textAlignment = NSTextAlignment.center
            headLabel.text = weekArr[item]
            headLabel.textColor = UIColor.black
            headLabel.backgroundColor = UIColor.init(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 0.3)
            self.view.addSubview(headLabel)
            nowIndex += width
        }
    }

}
