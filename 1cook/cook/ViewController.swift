//
//  ViewController.swift
//  cook
//
//  Created by chen on 2020/3/27.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookName.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = String (describing: UITableViewCell.self )
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier:cellId)
        }
        let curcookName = cookName [indexPath.row]
        cell?.textLabel?.text = curcookName;
        cell?.imageView?.image = UIImage(named: curcookName)
        cell?.detailTextLabel?.text = cookScores[indexPath.row]
        return cell!
    }
    
    //菜名
    var cookName = ["阿胶固元膏","玻璃糖饼干","桂花糯米藕","蚝油蘑菇","鸡蛋三明治","糯米烧卖","亲子丼","洋葱炒鸡蛋"]
    //分数
    var cookScores = ["9.1分","7.6分","6.9分","8.4分","5.3分","7.5分","8.2分","9.4分"]
    
    //设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60;
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return String.localizedStringWithFormat("共有 %lu 道菜肴信息", cookName.count)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "本餐馆的菜单信息";
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("当前选中的菜肴名称为：%          评分为：%",cookName[indexPath.row],cookScores[indexPath.row])
       // self.showMessage:message;
    }
    
    func showMessage (_message:String){
        let alertC = UIAlertController(title: "提示", message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertC.addAction(okAction)
        self.present(alertC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let row = indexPath.row
        if (row == 3){
            self.showMessage(_message: "该行被阻止选中了！")
        return nil;
        }
        return indexPath;
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

