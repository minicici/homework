//
//  ViewController.swift
//  car
//
//  Created by chen on 2020/3/27.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    var cars_total: NSArray = NSArray.init();//定义数组
    //设置分组
    func numberOfSections(in tableView: UITableView) -> Int {
        return cars_total.count;
    }
    //每个分组到行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dic:NSDictionary = cars_total[section] as! NSDictionary;
        let subCars:NSArray = dic.object(forKey: "cars")as! NSArray;
        return subCars.count;
    }
    //显示信息
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "carId");
        if !(cell != nil){
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "carId");
        }
        let dic:NSDictionary = cars_total[indexPath.section] as! NSDictionary;
        let subCars:NSArray = dic.object(forKey: "cars")as! NSArray;
        let subDic:NSDictionary = subCars[indexPath.row] as! NSDictionary;
        cell?.textLabel?.text = (subDic.object(forKey: "name") as! String);
        cell?.imageView?.image = UIImage.init(named: subDic.object(forKey: "icon")as! String);
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dic:NSDictionary = cars_total[section] as! NSDictionary;
        return (dic.object(forKey: "title")as! String);
    }
   
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let sectionTitle = NSMutableArray.init();
        let count = cars_total.count;
        for i in 0..<count{
            let dic:NSDictionary = cars_total[i] as!NSDictionary;
            sectionTitle.addObjects(from: [dic.object(forKey: "title")!]);
        }
        return (sectionTitle as! [String]);
    }
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     let fileName = Bundle.main.path(forResource: "cars_total", ofType: "plist")//获取plist文件路径
        cars_total = NSArray.init(contentsOfFile: fileName!)!;//初始化内容到cars_total数组中
    
    }

}


