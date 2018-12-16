//
//  addClassViewController.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/12.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit

class addClassViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    let mainTable : UITableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    
    let name_links_array : [String] =
        [
            "当前学期","设置节数","每周起始日"
        ]
    
    let start_week_array : [String] =
        [
            "周一","周二","周三","周四","周五","周六","周日"
    ]
    
    // MARK: Picker Delegate 实现代理方法
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //返回多少列
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //返回每一列有多少行
        return start_week_array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        //每行多高
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        // 每列多宽
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //赋值
        return start_week_array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //选中所执行的方法
        if 0 == component {
            
        }else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_links_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: nil)
        let title :String = name_links_array[indexPath.row] //获取应用名
        cell.textLabel!.text = title
        cell.detailTextLabel?.text = "测试"
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator; //显示最右边的箭头
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard.init(name: "Main", bundle:Bundle.main)
            let choseClassVC = sb.instantiateViewController(withIdentifier: "choseClassVC")
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(choseClassVC, animated: true)
            self.hidesBottomBarWhenPushed = true
        }
        if indexPath.row > 0 {
            let picker = UIView(frame: CGRect(x: 0, y: SCREEN_HEIGHT*0.7, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.3))
            self.view.addSubview(picker)
            let pickerView = UIPickerView(frame: CGRect(x: 0, y: SCREEN_HEIGHT*0.05, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.25))
            picker.addSubview(pickerView)
            let pickerToolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.05))
            let barItems = NSMutableArray()
            let cancelBtn = UIBarButtonItem.init(title: "取消", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addClassViewController.clickCancelBtn))
            barItems.add(cancelBtn)
            let btnSpace = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            barItems.add(btnSpace)
            let doneBtn = UIBarButtonItem.init(title: "完成", style: UIBarButtonItem.Style.done, target: self, action: #selector(addClassViewController.clickDoneBtn))
            barItems.add(doneBtn)
            pickerToolBar.setItems((barItems as! [UIBarButtonItem]), animated: true)
            picker.addSubview(pickerToolBar)
            pickerView.showsSelectionIndicator = true
            pickerView.delegate = self
            pickerView.dataSource = self
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func clickCancelBtn() {
        
    }
    
    @objc func clickDoneBtn() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "添加课程"
        self.view.addSubview(mainTable)
        mainTable.delegate = self
        mainTable.dataSource = self
        creatTableHead()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func creatTableHead() {
        let headView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.2))
        headView.backgroundColor = UIColor.init(displayP3Red: 188.0/255.0, green: 202.0/255.0, blue: 170.0/255.0, alpha: 0.8)
        let addClass = addClassBtn()
        let width = headView.bounds.size.width
        let height = headView.bounds.size.height
        addClass.frame = CGRect(x: width*0.1, y: height*0.1, width: width*0.167, height: height*0.8)
        addClass.createMyBtn(UIImage.init(named: "添加设备")!, andTitle: "添加课程")
        headView.addSubview(addClass)
        let plusClass = addClassBtn()
        plusClass.frame = CGRect(x: width*0.43, y: height*0.1, width: width*0.167, height: height*0.8)
        plusClass.createMyBtn(UIImage.init(named: "17-毕业")!, andTitle: "蹭课")
        headView.addSubview(plusClass)
        let shareClass = addClassBtn()
        shareClass.frame = CGRect(x: width*0.75, y: height*0.1, width: width*0.167, height: height*0.8)
        shareClass.createMyBtn(UIImage.init(named: "分享2")!, andTitle: "分享课表")
        headView.addSubview(shareClass)
        mainTable.tableHeaderView = headView
        let view = UIView()
        view.backgroundColor = UIColor.clear
        mainTable.tableFooterView = view
    }
    
    
    
    
    func initTableView() {
        
    }
   
    

}
