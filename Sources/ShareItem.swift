//
//  ShareItem.swift
//  CWShareView
//
//  Created by chenwei on 2017/8/24.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

public typealias SelectionHandler = ((ShareItem) -> Void)

public class ShareItem: NSObject {
    /// 标题
    public var title: String
    /// 图片名称
    public var icon: UIImage
    /// 点击事件
    public var selectionHandler: SelectionHandler?
    
    public init(title: String, icon: UIImage, selectionHandler: SelectionHandler? = nil) {
        self.title = title
        self.icon = icon
        self.selectionHandler = selectionHandler
    }
}
