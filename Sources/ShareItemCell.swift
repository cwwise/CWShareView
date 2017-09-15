//
//  ShareItemCell.swift
//  CWShareView
//
//  Created by chenwei on 2017/8/24.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

class ShareItemCell: UICollectionViewCell {
    /// 按钮
    var iconButton: UIButton
    /// 文字
    var titleLable: UILabel
    
    var cellClicked: ((ShareItemCell) -> Void)?
    
    var shareItem: ShareItem! {
        didSet {
            setupInfo()
        }
    }
    
    override init(frame: CGRect) {
       
        titleLable = UILabel()
        iconButton = UIButton(type: .custom)
        super.init(frame: frame)
        
        titleLable.numberOfLines = 2
        titleLable.font = UIFont.systemFont(ofSize: 11)
        titleLable.textColor = UIColor.darkGray
        titleLable.textAlignment = .center
        contentView.addSubview(titleLable)
                
        iconButton.addTarget(self, action: #selector(iconButtonClick), for: .touchUpInside)
        contentView.addSubview(iconButton)
    }
    
    func setupInfo() {
        titleLable.text = shareItem.title
        iconButton.setImage(shareItem.icon, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let contentWidth = self.frame.width
        let iconButtonSize = shareItem.icon.size
        iconButton.frame = CGRect(x: (contentWidth-iconButtonSize.width)/2, 
                                  y: 0,
                                  width: iconButtonSize.width, 
                                  height: iconButtonSize.height)
   
        let size = titleLable.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        titleLable.frame = CGRect(x: 0, y: iconButtonSize.height+8, 
                                  width: contentWidth, height: ceil(size.height))
    }
    
    // MARK: Action
    @objc func iconButtonClick() {
        if let shareItem = shareItem, let selectionHandler = shareItem.selectionHandler {
            selectionHandler(shareItem)
        }
        
        if let cellClicked = cellClicked {
            cellClicked(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
