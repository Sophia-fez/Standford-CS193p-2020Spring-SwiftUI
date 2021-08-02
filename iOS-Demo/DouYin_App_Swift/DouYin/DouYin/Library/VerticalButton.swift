//
//  VerticalButton.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/20.
//

import UIKit

// 按钮上图下字居中显示
@IBDesignable class VerticalButton: UIButton {
    
    @IBInspectable public var padding: CGFloat = 5.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        
        if let titleSize = titleLabel?.sizeThatFits(maxSize), let imageSize = imageView?.sizeThatFits(maxSize) {
            let width = ceil(max(imageSize.width, titleSize.width))
            let height = ceil(imageSize.height + titleSize.height + padding)
            
            return CGSize(width: width, height: height)
        }
        
        return super.intrinsicContentSize
    }
    
    override func layoutSubviews() {
        if let image = imageView?.image, let title = titleLabel?.attributedText {
            let imageSize = image.size
            let titleSize = title.size()
            
            // top,bottom,right都是相对于button
            // left是相对于image的，用-imageSize.width抵消默认值imageSize.width才能到button的最左边
            titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + padding), right: 0.0)
            // top,bottom,left都是相对于button
            // right是相对于title的，同理用-titleSize.width到button的最右边
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + padding), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
        
        super.layoutSubviews()
    }
    
}
