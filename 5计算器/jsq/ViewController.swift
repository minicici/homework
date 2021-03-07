//
//  ViewController.swift
//  jsq
//
//  Created by chen on 2020/3/9.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num1 = 0.0
    var num2 = 0.0
    var result = 0.0
    var fuhao = 0
    
   
    @IBOutlet weak var numberlable: UILabel!
    
    @IBAction func numtouch(_ sender: UIButton) {
        numberlable.text = numberlable.text! + sender.currentTitle!
    }
    
    @IBAction func cleartouche(_ sender: UIButton) {
        numberlable.text = ""
    }
    
    @IBAction func backtouche(_ sender: UIButton) {
        let n = numberlable.text!.count           //统计标签里面字符串的个数
        if n > 0{
            numberlable.text = (numberlable.text! as NSString).substring(to: n-1)
        }
    }
    
    @IBAction func diantouche(_ sender: UIButton) {
        if numberlable.text!.contains(".") == false{
        numberlable.text = numberlable.text! + "."
        }
    }
    @IBAction func zftouch(_ sender: UIButton) {
        if numberlable.text!.contains("-") == false{
            numberlable.text = "-" + numberlable.text!
        }
        else{
            numberlable.text = (numberlable.text! as NSString).replacingOccurrences(of: "-", with: "")
        }
    }
    
    @IBAction func yunsuantouch(_ sender: UIButton) {
        if numberlable.text!.isEmpty{
            showMessage( message: "请输入第一个数： ")
            return
        }
        fuhao = sender.tag
        num1 = Double(numberlable.text!)!
        numberlable.text = ""
    }
    
    func showMessage (message:String)   //提示对话框
    {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let okAtion = UIAlertAction (title: "确定", style: .default, handler: nil)
        alert.addAction(okAtion)//把确定按钮放到报警对话框上
        self.present (alert,animated: true,completion: nil)
    }
    
    @IBAction func resultouch(_ sender: UIButton) {
        if numberlable.text!.isEmpty{
            showMessage( message: "请输入第2个数： ")
            return
        }
       num2 = Double(numberlable.text!)!
        switch fuhao {
        case 1:
           result = num1 + num2
            break
        case 2:
            result = num1 - num2
            break
        case 3:
            result = num1 * num2
            break
        case 4:
            result = num1 / num2
            break
        default:
            break
        }
        if numberlable.text!.contains(".") == true{
            numberlable.text = String(format:"%0.2f",result)
        }
        else{
            numberlable.text = String(format:"%0.0f",result)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

