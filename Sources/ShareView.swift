//
//  ShareView.swift
//  CWShareView
//
//  Created by chenwei on 2017/8/24.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

struct ShareViewConfigure {
    var itemSize = CGSize(width: 80, height: 80)

}

private let duration: TimeInterval = 0.25

private let kScreenWidth = UIScreen.main.bounds.width
private let kScreenHeight = UIScreen.main.bounds.height

public class ShareView: UIView {
    
    public var shareItems: [[ShareItem]] = []
    
    var backgroundButton: UIButton!
    public var containerView: UIView!
    
    fileprivate var collectionView: UICollectionView!
    public var headerView: UIView!
    public var bottomView: UIView!

    var containViewColor: UIColor 
    
    convenience init() {
        let frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        containViewColor = UIColor.white

        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        
        backgroundButton = UIButton(type: .custom)
        backgroundButton.frame = self.bounds
        backgroundButton.addTarget(self, action: #selector(hide), for: .touchUpInside)
        self.addSubview(backgroundButton)

        containerView = UIView()
        self.addSubview(containerView)
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: kScreenHeight, width: kScreenWidth, height: 0), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(ShareItemCell.self, forCellWithReuseIdentifier: "cell")
        containerView.addSubview(collectionView)
        
        
        containerView.backgroundColor = containViewColor
    }
    
 
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("deinit")
    }
}

// MARK: - 显示 隐藏
extension ShareView {
    
    func show(in view: UIView) {
        
        view.addSubview(self)
        // 计算高度
        let height: CGFloat = 300
        self.containerView.frame = CGRect(x: 0, y: kScreenHeight, width: kScreenWidth, height: height)
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: { 

            self.backgroundButton.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            let rect = self.containerView.frame.offsetBy(dx: 0, dy: -self.containerView.frame.height)
            self.containerView.frame = rect
            
        }) { (finshed) in

        }
        
    }
    
    func hide() {
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: { 
            
            self.backgroundButton.backgroundColor = UIColor.clear
            let rect = self.containerView.frame.offsetBy(dx: 0, dy: self.containerView.frame.height)
            self.containerView.frame = rect
            
        }) { (finshed) in
            self.removeFromSuperview()
        }
        
    }
    
}



extension ShareView: UICollectionViewDelegate,UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return shareItems.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shareItems[section].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShareItemCell
        return cell 
    }
    

}
