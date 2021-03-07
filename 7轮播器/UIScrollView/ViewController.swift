//
//  ViewController.swift
//  UIScrollView
//
//  Created by chen on 2020/3/15.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let count = 6
        let imageY:CGFloat = 0
        let imageW = scrollView.frame.size.width
        let imageH = scrollView.frame.size.height
        for i in 0...count-1
        {
            let imageX = imageW * CGFloat(i)
            let imageView = UIImageView.init(frame: CGRect (x:imageX,y:imageY,width:imageW,height:imageH))
            let imageName = String(format: "img_0%d",i+1)
            imageView.image = UIImage(named: imageName)
            scrollView.addSubview(imageView)//往scrollView里添加子视图imageView
            
        }
        let contentW = imageW * CGFloat(count)
        scrollView.contentSize = CGSize(width: contentW, height: 0)//滚动大小 s左右为图片大小 上下不能滚动为0
        
        scrollView.showsVerticalScrollIndicator = false //水平滚动条隐藏
        scrollView.isPagingEnabled = true //允许分页
        
        pageControl.numberOfPages = count
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)//判断当前页为哪一页
    {
        let imageW = scrollView.frame.size.width
        let page = (scrollView.contentOffset.x + imageW/2)/imageW
        pageControl.currentPage = Int(page)
    }
    
    //定时器
    var timer :Timer?
    
    func addTimer ()
    {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(nextImage) , userInfo: nil, repeats: true)
    }
    
    @objc func nextImage()
    {
        let count = 6
        var page = pageControl.currentPage
        if page == count-1
        {
            page = 0
        }
        else
        {
            page = page + 1
        }
    
    let offsetX = scrollView.frame.size.width * CGFloat(page)
    let offset = CGPoint(x: offsetX, y: 0)
    
    scrollView.setContentOffset(offset,animated:true)
    }
    
    func removeTimer ()//移除定时器
    {
        timer?.invalidate()
        timer = nil
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)//鼠标放上（准备拖拽
    {
        removeTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)//鼠标结束（结束拖拽
    {
        addTimer()
    }
}



