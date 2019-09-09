//
//  CircleGraph.swift
//  ABN
//
//  Created by Paul Geurts on 20/06/2018.
//  Copyright © 2018 ABN AMRO. All rights reserved.
//

import Foundation
import UIKit

class CircleGraph: UIView {
    
    let strokeWidth: CGFloat
    let radius: CGFloat
    let passiveColor: UIColor
    let activeColor: UIColor
    let reservedColor: UIColor
    
    init(frame: CGRect, strokeWidth: CGFloat, passiveColor: UIColor, activeColor: UIColor, reservedColor: UIColor) {
        
        self.passiveColor = passiveColor
        self.activeColor = activeColor
        self.reservedColor = reservedColor
        self.strokeWidth = strokeWidth
        self.radius = frame.size.width / 2.0 - strokeWidth / 2.0

        super.init(frame: frame)
        
        drawTrackPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawTrackPath() {
        self.drawCircle(center: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, color: passiveColor, animationDuration: 0)
    }
    
    func drawTwoLayerArc(from start: CGFloat, to end: CGFloat, animationDuration: Double) {
        
        let direction = end - start
       
        if direction >= 0 {
            //Forward animation
            //Static circle for actual amount, remains after animation
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * start, color: activeColor, animationDuration: 0, clockwise: true)
            
            //Animating circle, disappears after animation
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * start, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * end, color: activeColor, animationDuration: animationDuration, clockwise: true)
        } else {
            //Backward animation
            //Static circle for actual amount, remains after animation
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * end, color: activeColor, animationDuration: 0, clockwise: false)
            
            //Animating circle, disappears after animation
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * end, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * start, color: activeColor, animationDuration: animationDuration, clockwise: false)
        }
    }
    
    func drawThreeLayerArc(from start: CGFloat, to end: CGFloat, toto endend: CGFloat, animationDuration: Double) {
        
            //Backward animation
            //Static circle for declaration amount
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * end, color: reservedColor, animationDuration: 0, clockwise: false)
            
            //Static circle for actual amount
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * endend, color: activeColor, animationDuration: 0, clockwise: false)
            
            //Animating circle for actual amount
            self.drawCircle(center: self.center, radius: radius, startAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * endend, endAngle: -CGFloat.pi / 2 + 2 * CGFloat.pi * start, color: activeColor, animationDuration: animationDuration, clockwise: false)
    }
    
    func drawCircle(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: UIColor, animationDuration: Double, clockwise: Bool = true) {
        
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = strokeWidth
        
        let fromValue: CGFloat = clockwise ? 0 : 1
        let toValue: CGFloat = clockwise ? 1 : 0
        
        if animationDuration > 0 {
            let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
            pathAnimation.duration = animationDuration
            pathAnimation.fromValue = fromValue
            pathAnimation.toValue = toValue
            pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            shapeLayer.add(pathAnimation, forKey: "PathAnimation")
            shapeLayer.strokeEnd = toValue
            
        }
        
        layer.addSublayer(shapeLayer)
    }
}
