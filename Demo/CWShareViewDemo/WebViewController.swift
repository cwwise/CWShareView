//
//  WebViewController.swift
//  CWShareViewDemo
//
//  Created by chenwei on 2017/9/2.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    private var webView: WKWebView!
    /// url
    var url: URL?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required convenience init(url: URL?) {
        self.init()
        self.url = url
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(webView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    //完成
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
        
    }
    
}
