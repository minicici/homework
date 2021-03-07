//
//  ViewController.swift
//  tom
//
//  Created by chen on 2020/3/14.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBAction func drink(_ sender: UIButton) {//喝牛奶
        let imageCount = 81
        btnClick(imageCount: imageCount , btnName : "drink_")
    }
    
    
    @IBAction func fart(_ sender: UIButton) {//放屁
        let imageCount = 28
        btnClick(imageCount: imageCount, btnName: "fart_")
    }
    
    
    @IBAction func cymbal(_ sender: UIButton) {//敲锣
        let imageCount = 13
        btnClick(imageCount: imageCount, btnName: "cymbal_")
    }
    
    
    @IBAction func eat(_ sender: UIButton) {//吃东西
        let imageCount = 40
        btnClick(imageCount: imageCount, btnName: "eat_")
    }
    
    
    @IBAction func scratch(_ sender: UIButton) {//抓
        let imageCount = 56
        btnClick(imageCount: imageCount, btnName: "scratch_")
    }
    
    
    @IBAction func pie(_ sender: UIButton) {//拍
        let imageCount = 24
        btnClick(imageCount: imageCount, btnName: "pie_")
    }
    
    
    @IBAction func footleft(_ sender: UIButton) {//左脚
        let imageCount = 30
        btnClick(imageCount: imageCount, btnName: "footleft_")
    }
    
    
    @IBAction func footright(_ sender: UIButton) {//右脚
        let imageCount = 30
        btnClick(imageCount: imageCount, btnName: "footright_")
    }
    
    @IBAction func stomach(_ sender: UIButton) {
        let imageCount = 34
        btnClick(imageCount: imageCount, btnName: "stomach_")
    }
    
    @IBAction func knockout(_ sender: UIButton) {
        let imageCount = 81
        btnClick(imageCount: imageCount, btnName: "knockout_")
    }
    
    func btnClick(imageCount:Int, btnName:String){
        
        //---1.添加图片到数组中
        var imgArray = [UIImage]()
        for var i in 0...imageCount-1
        {
            let imageName = i<10 ? "\(btnName)" + "0\(i)" : "\(btnName)" + "\(i)"
            let image = UIImage(named: String(imageName))!
            imgArray.insert(image, at: i)
            i=i+1
        }
        
        //----2.将数组添加到UIImageView中
        imageview.animationImages = imgArray
        //----3. 设置动画的持续时间
        imageview.animationDuration = Double(imgArray.count) * 0.1
        //----4. 设置动画的持续次数
        imageview.animationRepeatCount = 1
        //----5. 开启动画
        imageview.startAnimating()
    }


}

