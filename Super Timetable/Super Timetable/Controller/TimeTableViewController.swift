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
/*
 课程表
    X：屏宽/8 (星期确定X)
    Y：屏高/10 （起始节数确认起始Y<默认0>,节数确定高度）
    列宽：屏宽/8
    行高：屏高/10
 **/
class TimeTableViewController: UIViewController {

    var result_array:[String] =
        [
            "","",""
        ]
    
    override func viewWillAppear(_ animated: Bool) {
        print(result_array)
        addToClassTable(result_array[0], weekMatch(result_array[2]), countMatch(result_array[1]))
        result_array =
        [
        "","",""
        ]
    }
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
    //添加按钮
    @objc func leftButtonClicked(){
        let sb = UIStoryboard.init(name: "Main", bundle:Bundle.main)
        let addVC = sb.instantiateViewController(withIdentifier: "addVC") as! addClassViewController
        addVC.blo = {a,b,c in
            self.result_array[0] = a
            self.result_array[1] = b
            self.result_array[2] = c
        }
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    //头部时间视图
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
    //添加课程至tableView
    func addToClassTable(_ name:String ,_ week:Int ,_ count:Int) -> Void {
        let cView = classView()
        cView.backgroundColor = UIColor.init(displayP3Red: 188.0/255.0, green: 202.0/255.0, blue: 170.0/255.0, alpha: 0.8)
        cView.frame = CGRect(x: CGFloat(Float(week)*Float(SCREEN_WIDTH)/8.0),
                             y: SCREEN_HEIGHT*0.08+116,
                             width: SCREEN_WIDTH/8.0,
                             height: CGFloat(Float(count)*Float(SCREEN_HEIGHT)/10.0)
                            )
        cView.addClassView(name)
        self.view.addSubview(cView)
    }
    //节数匹配
    func countMatch(_ str:String) -> Int {
        switch str {
        case "1节":
            return 1;
        case "2节":
            return 2;
        case "3节":
            return 3;
        case "4节":
            return 4;
        case "5节":
            return 5;
        case "6节":
            return 6;
        case "7节":
            return 7;
        case "8节":
            return 8;
        default:
            return 0;
        }
    }
    //星期匹配
    func weekMatch(_ str:String) -> Int {
        switch str {
        case "周一":
            return 1;
        case "周二":
            return 2;
        case "周三":
            return 3;
        case "周四":
            return 4;
        case "周五":
            return 5;
        case "周六":
            return 6;
        case "周日":
            return 7;
        default:
            return 0;
        }
    }
    
    
}
