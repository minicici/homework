//
//  ViewController.swift
//  picker2
//
//  Created by chen on 2020/3/20.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //确定转轮行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return animalName.count
        }
        else{
            return animalSound.count
        }
    }
    
    //实现委托协议,为转轮提供数据
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView  {
        if component == 0 {//左边放图片 图片控件
            let imageName = "\(animalImage[row])"// 从动物数组中获得行号从而得到动物名称
            let image = UIImage (named: imageName)//根据名称找到对应图片
            let imageView = UIImageView(image: image)
            return imageView
        }
        else{//右边放声音字符串 标签控件
            let soundLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
            soundLabel.text = "\(animalSound[row])"
            return soundLabel
        }
    }
    //每个转轮每一行的宽度
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0{
            return 150
        }
        else {
            return 150
        }
    }
    //行高，转轮每一行的高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }

    @IBOutlet weak var lastAction: UILabel!
    
    
    @IBOutlet weak var matchResult: UILabel!
    
    
    //定义数组
    var animalName = ["Mouse","Goose","Cat","Dog","Snake","Bear","Pig"]
    var animalSound = ["Okin","Rawr","Ssss","Roof","Meow","Honk","Squeak"]
    var animalImage = ["mouse","goose","cat","dog","snake","bear","pig"]
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            lastAction.text = "you select the animal name\(animalName[row])"
        }
        else{
            lastAction.text = "you select the animal sound \(animalSound[row])"
        }
        
        //匹配
        let selectedanimal = pickerView.selectedRow(inComponent: 0)
        let selectsound = pickerView.selectedRow(inComponent: 1)
        if selectedanimal == animalSound.count - 1 - selectsound{
            matchResult.text = "Yes,a\(animalName[selectedanimal]) does go \(animalSound[selectsound])"
        }
        else {
            matchResult.text = "Yes,a\(animalName[selectedanimal]) doesn't go\(animalSound[selectsound])"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

