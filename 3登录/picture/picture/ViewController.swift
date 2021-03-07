//
//  ViewController.swift
//  picture
//
//  Created by chen on 2020/3/13.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func  show() {

    }
    @IBOutlet weak var username: UITextField!
    func showMessage(_ message:String)
    {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let okAtion = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(okAtion)
        self.present(alert, animated: true,completion: nil)
    }
    
    @IBOutlet weak var userpassword: UITextField!
    

    @IBAction func login(_ sender: Any) {
        //设用户名为chen，密码为123
        if username.text == ""{
            showMessage("账户名不能为空")
            return;
        }
        if userpassword.text == ""{
             showMessage("密码不能为空")
            return;
        }
        if username.text != "chen" {
            showMessage("账户名不对")
            return;
        }
        if userpassword.text != "123" {
            showMessage("密码名不对")
            return;
        }
        showMessage("登录成功！！！！！")
    }
    
    @IBAction func hide(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    }


}
