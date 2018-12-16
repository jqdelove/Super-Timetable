//
//  MyViewController.swift
//  Super Timetable
//
//  Created by 金奇 on 2018/12/12.
//  Copyright © 2018 金奇. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func myBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "系统提示",message: "此功能正在开发中！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func accessBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "系统提示",message: "此功能正在开发中！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "系统提示",message: "此功能正在开发中！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func recommandBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "系统提示",message: "此功能正在开发中！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
