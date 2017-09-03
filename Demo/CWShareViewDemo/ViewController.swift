//
//  ViewController.swift
//  CWShareViewDemo
//
//  Created by chenwei on 2017/9/1.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit
import CWShareView

class ViewController: UIViewController {

    var shareList1: [ShareItem] = []
    var shareList2: [ShareItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupList1()
        setupList2()
    }
    
    func setupList1() {
        
        let shareItem1 = ShareItem(title: "发送给朋友", icon: #imageLiteral(resourceName: "Action_Share"))
        let shareItem2 = ShareItem(title: "分享到朋友圈", icon: #imageLiteral(resourceName: "Action_Moments"))
        let shareItem3 = ShareItem(title: "收藏", icon: #imageLiteral(resourceName: "Action_MyFavAdd"))
        let shareItem4 = ShareItem(title: "在Safari中打开", icon: #imageLiteral(resourceName: "Action_Safari"))
        let shareItem5 = ShareItem(title: "分享到新浪", icon: #imageLiteral(resourceName: "Action_Sina"))
        let shareItem6 = ShareItem(title: "分享到QQ", icon: #imageLiteral(resourceName: "Action_QQ"))
        let shareItem7 = ShareItem(title: "分享到QQ空间", icon: #imageLiteral(resourceName: "Action_qzone"))
        let shareItem8 = ShareItem(title: "分享到Facebook", icon: #imageLiteral(resourceName: "Action_facebook"))
        
        shareList1.append(contentsOf: [shareItem1, shareItem2, shareItem3, shareItem4,
                                       shareItem5, shareItem6, shareItem7, shareItem8])
    }
    
    func setupList2() {
        
        let shareItem1 = ShareItem(title: "查看公众号", icon: #imageLiteral(resourceName: "Action_Verified"))
        let shareItem2 = ShareItem(title: "复制链接", icon: #imageLiteral(resourceName: "Action_Copy"))
        let shareItem3 = ShareItem(title: "调整字体", icon: #imageLiteral(resourceName: "Action_Font"))
        let shareItem4 = ShareItem(title: "刷新", icon: #imageLiteral(resourceName: "Action_Refresh"))

        shareList2.append(contentsOf: [shareItem1, shareItem2, shareItem3, shareItem4])
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {

        let clickedHandler = { (shareView: ShareView, indexPath: IndexPath) in
            print(indexPath.section, indexPath.row)
        }
        
        let title = "网页由mp.weixin.qq.com提供"
        let shareView = ShareView(title: title,
                                  shareItems: [shareList1, shareList2], 
                                  clickedHandler: clickedHandler)        
        shareView.show()
    }

    @IBAction func weixinAction(_ sender: UIButton) {
        let clickedHandler = { (shareView: ShareView, indexPath: IndexPath) in
            print(indexPath.section, indexPath.row)
        }
        
        let shareView = ShareView(squareItems: shareList1, clickedHandler: clickedHandler)        
        shareView.show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

