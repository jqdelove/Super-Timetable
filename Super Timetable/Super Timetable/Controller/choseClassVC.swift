//
//  choseClassVC.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/13.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit
//声明代理
protocol chooseDelegate {
    //字符串参数无返回值
    func backStr(str:String) -> Void
}
//声明block
typealias block = (_ str:String)->Void
class choseClassVC: UIViewController {
    public var dataToA = ""
    @IBOutlet weak var txtClassName: UITextField!
    var myBlock : block!
    var delegate : chooseDelegate!
    @IBAction func btOK(_ sender: UIButton) {
        dataToA = txtClassName.text!
        //代理或者block传值
//        self.delegate.backStr(str: dataToA)
        self.myBlock(dataToA)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "当前学期"
    }
    
    
   

}
