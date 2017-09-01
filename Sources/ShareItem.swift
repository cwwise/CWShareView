//
//  ShareItem.swift
//  CWShareView
//
//  Created by chenwei on 2017/8/24.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

public class ShareItem: NSObject {
    
    typealias SelectionHandler = ((_ item: ShareItem) -> Void)
    
    var title: String
    var icon: String
    var selectionHandler: SelectionHandler?
    
    init(title: String, icon: String) {
        self.title = title
        self.icon = icon
    }
}
