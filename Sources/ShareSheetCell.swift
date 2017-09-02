//
//  ShareSheetCell.swift
//  CWShareViewDemo
//
//  Created by chenwei on 2017/9/1.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

class ShareSheetCell: UICollectionViewCell {

    var shareItems: [ShareItem] = []
    
    var collectionView: UICollectionView!
    
    var bottomLine: UIView!
    
    var sheetCellClicked: ((ShareSheetCell, Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        layout.itemSize = kItemSize
        
        collectionView = UICollectionView(frame: self.contentView.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShareItemCell.self, forCellWithReuseIdentifier: "cell")
        self.contentView.addSubview(collectionView)
        
        bottomLine = UIView()
        bottomLine.backgroundColor = UIColor(hex6: 0xc3c3c3)
        let lineHeight = 1/UIScreen.main.scale
        bottomLine.frame = CGRect(x: 15, y: self.bounds.height,
                                  width: self.bounds.width-15, height: lineHeight)
        self.contentView.addSubview(bottomLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ShareSheetCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shareItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShareItemCell
        cell.shareItem = shareItems[indexPath.row]
        cell.cellClicked = { (shareCell) in
            self.sheetCellClicked?(self, indexPath.row)
        }
        return cell
    }
    
    
}
