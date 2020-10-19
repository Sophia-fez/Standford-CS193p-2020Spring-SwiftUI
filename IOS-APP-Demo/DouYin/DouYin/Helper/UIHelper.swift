//
//  UIHelper.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/16.
//

import UIKit
import Lottie

var layers = [CAShapeLayer]()

// 让属性改动可以在storyboard上看到
@IBDesignable open class ClippedView: UIView {
    // 只继承不改动
}

extension UIView {
    // @IBInspectable 在storyboard里可见，并在里面设置
    // 加圆角
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // 加边框
    @IBInspectable public var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 边框颜色
    @IBInspectable public var borderColor: UIColor {
        get {
            UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    // 阴影色
    @IBInspectable public var shadowColor: UIColor {
        get {
            UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    // 阴影的位移
    @IBInspectable public var shadowOffset: CGSize {
        get {
            layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    // 阴影的圆角
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    // 阴影的透明度
    @IBInspectable public var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false // 让透明度起效
        }
    }
    
    
    // 音符散发动画
    func raiseAnimate(imageName: String, delay: TimeInterval) {
        let path = UIBezierPath() // 贝塞尔曲线
        
        // 起点；视图的中间
        let beginPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        
        // 控制点的位移，使用随机数
        let a : CGFloat = 2
        let b : CGFloat = 1.5
        let c : CGFloat = 3
        let offset1 = [a, b, c]
        
        let cxOffset = offset1.randomElement()! * bounds.maxX
        let cyOffset = offset1.randomElement()! * bounds.maxY
        
        // 终点的位移，使用随机数
        let e : CGFloat = 1.5
        let d : CGFloat = 1
        let f : CGFloat = 0.8
        let offset2 = [e, d, f]
        
        let g : CGFloat = 2.5
        let h : CGFloat = 3
        let i : CGFloat = 2
        let offset3 = [g, h, i]
        
        let exOffset = offset2.randomElement()! * bounds.maxX
        let eyOffset = offset3.randomElement()! * bounds.maxY
        
        // 终点、控制点
        let controlPoint = CGPoint(x: beginPoint.x - cxOffset, y: beginPoint.y - cyOffset)
        let endPoint = CGPoint(x: beginPoint.x - exOffset, y: beginPoint.y - eyOffset)
        
        path.move(to: beginPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        // 动画组
        let group = CAAnimationGroup()
        group.duration = 4 // 持续时间4s
        group.beginTime = CACurrentMediaTime() + delay // 动画延迟时间
        group.repeatCount = .infinity // 无限重复动画
        group.isRemovedOnCompletion = false // 动画不自动移除
        group.fillMode = .forwards // 填充模式：向前
        group.timingFunction = CAMediaTimingFunction(name: .linear) // 动画的方式：线性动画
        
        // 贝塞尔曲线
        let pathAnimation = CAKeyframeAnimation(keyPath: "position") // 使用关键帧动画实现
        pathAnimation.path = path.cgPath
        
        // 旋转动画
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotateAnimation.values = [0, .pi / 2.0, .pi / 1.0]
        
        // 透明度动画
        let alphaAnimation = CAKeyframeAnimation(keyPath: "opacity")
        alphaAnimation.values = [0, 0.3, 1, 0.3, 0]
        
        // 缩放动画
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.values = [1.0, 1.8, 2.0]
        
        group.animations = [pathAnimation, rotateAnimation, alphaAnimation, scaleAnimation]
        
        
        // 新建一个CAShapeLayer层用来放动画
        let layer = CAShapeLayer()
        
        layer.opacity = 0
        layer.contents = UIImage(named: imageName)?.cgImage // 音符图片
        layer.frame = CGRect(origin: beginPoint, size: CGSize(width: 10, height: 10)) // 音符大小
        self.layer.addSublayer(layer) // 将这个层添加到唱盘这个视图之上
        
        layer.add(group, forKey: nil) // 给这个层添加动画
        
        layers.append(layer) // 动画层添加到动画数组中，所有的层都由layers管理
    }
    
    // 清除上一个页面所有动画，还原初试状态，以便重复使用单元格
    func resetViewAnimation() {
        for layer in layers {
            layer.removeFromSuperlayer()
        }
        self.layer.removeAllAnimations()
    }
}
