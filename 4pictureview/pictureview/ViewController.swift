//
//  ViewController.swift
//  pictureview
//
//  Created by chen on 2020/3/21.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picview: UIImageView!
    
    
    @IBOutlet weak var filename: UILabel!
    @IBOutlet weak var alpha: UILabel!
    
    @IBOutlet weak var woniu: UIImageView!
    @IBOutlet weak var silder: UISlider!
    
    var i = 1
    //前一个
    @IBAction func priortouch(_ sender: UIBarButtonItem) {
        i = i-1
        if i == 0{
            i = 9
        }
        let fileName = String(format: "p\(i).jpg")//获取图片名称（用字符串表示，引号中的格式）
        picview.image = UIImage(imageLiteralResourceName: fileName)//根据图片名称找到图片并放入图片视图当中
        filename.text = String(format: "当前文件名为\(fileName)")
    }
    
    
    @IBAction func nexttouch(_ sender: UIBarButtonItem) {
        i = i+1
        if i == 10{
            i = 1
        }
        let fileName = String(format: "p\(i).jpg")//获取图片名称（用字符串表示，引号中的格式）
        picview.image = UIImage(imageLiteralResourceName: fileName)//根据图片名称找到图片并放入图片视图当中
        filename.text = String(format: "当前文件名为\(fileName)")
    }
    
    @IBAction func silderchanged(_ sender: UISlider) {
        picview.alpha = CGFloat(sender.value)
        alpha.text = String(format: "当前透明度为:%0.2f", sender.value)
    }
    
    @IBAction func segchanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            picview.alpha = 0.0
            alpha.text = "当前透明度为：0.0"
            silder.value = 0.0
            break
        case 1:
            picview.alpha = 0.2
            alpha.text = "当前透明度为：0.2"
            silder.value = 0.2
            break
        case 2:
            picview.alpha = 0.4
            alpha.text = "当前透明度为：0.4"
            silder.value = 0.4
            break
        case 3:
            picview.alpha = 0.6
            alpha.text = "当前透明度为：0.6"
            silder.value = 0.6
            break
        case 4:
            picview.alpha = 0.8
            alpha.text = "当前透明度为：0.8"
            silder.value = 0.8
            break
        case 5:
            picview.alpha = 1.0
            alpha.text = "当前透明度为：1.0"
            silder.value = 1.0
            break
        default:
            break

    }
    }
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn == false{
            woniu.stopAnimating()
        }
        else{
            woniu.startAnimating()
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var imgArray = [UIImage]()
        for var j in 0...11
        {
            let imageName = "10\(j).png"
            let iamge = UIImage(named: String(imageName))!
            imgArray.insert(iamge, at: j)
            woniu.animationImages = imgArray
            woniu.startAnimating()
            j = j + 1
        }

    }


}

