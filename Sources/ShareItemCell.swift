//
//  ShareItemCell.swift
//  CWShareView
//
//  Created by chenwei on 2017/8/24.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

class ShareItemCell: UICollectionViewCell {
    
    var iconButton: UIButton!
    var titleLable: UILabel!
    
    var shareItem: ShareItem! {
        didSet {
            setupInfo()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLable = UILabel()
        titleLable.numberOfLines = 2
        titleLable.font = UIFont.systemFont(ofSize: 12)
        titleLable.textColor = UIColor.darkGray
        self.contentView.addSubview(titleLable)
        
        iconButton = UIButton(type: .custom)
        iconButton.addTarget(self, action: #selector(iconButtonClick), for: .touchUpInside)
        self.contentView.addSubview(iconButton)
    }
    
    func setupInfo() {
        titleLable.text = shareItem.title
        iconButton.setImage(UIImage(named: shareItem.icon), for: .normal)
    }
    
    override func layoutSubviews() {
        
    }
    
    // MARK: Action
    func iconButtonClick() {
        if let selectionHandler = shareItem.selectionHandler {
            selectionHandler(shareItem)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
