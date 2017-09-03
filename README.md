# CWShareView

> 仿写微信分享功能

## 目录 Contents

* [环境 Requirements](#环境-requirements)
* [功能 Feature](#功能-feature)
* [预览 Preview](#预览-preview)
* [使用 Usage](#使用-usage)
* [许可 License](#许可-license)


## 环境 Requirements

* iOS 8.0+
* Xcode 8.3+
* Swift3.1

## 功能 Feature
- [x] 模仿微信ShareView
- [x] 模仿九宫格分享View
- [ ] 更好的自定义
- [ ] 完善注释，更好的readme 

## 预览 Preview

![CWShareViewDemo_1](https://github.com/cwwise/CWShareView/blob/master/Preview/CWShareViewDemo_1.png)
![CWShareViewDemo_2](https://github.com/cwwise/CWShareView/blob/master/Preview/CWShareViewDemo_2.png)


## 使用 Usage

* 导入方法：
 
  * 方法一（推荐使用）：[CocoaPods](https://cocoapods.org/)：`pod 'CWShareView'`

* 在相应位置导入头文件：`import CWShareView`

* 调用下列任意方法即可：

```swift
    let clickedHandler = { (shareView: ShareView, indexPath: IndexPath) in
            print(indexPath.section, indexPath.row)
        }
        
    let title = "网页由mp.weixin.qq.com提供"
    let shareView = ShareView(title: title,
                              shareItems: [shareList1, shareList2], 
                              clickedHandler: clickedHandler)        
    shareView.show()
```
  

## 许可 License

CWShareView is released under the [MIT License](https://github.com/cwwise/CWShareView/blob/master/LICENSE).


