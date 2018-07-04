//
//  UIView.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIView
{
    // MARK: Corner
    func cornerRadius(radius: CGFloat)
    {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func circleView()
    {
        let halfWidth = self.layer.frame.size.height/2
        cornerRadius(radius: halfWidth)
    }
    
    
    // MARK: Border
    func border(withColor color: UIColor, andWidth width: CGFloat)
    {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    
    // MARK: Gradient
    private func gradientColors(colors: [CGColor]) -> CAGradientLayer
    {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        
        return gradientLayer
    }
    
    func verticalGradient(withColors colors: [CGColor])
    {
        let gradientLayer = gradientColors(colors: colors)
        
        self.layer.addSublayer(gradientLayer)
    }
    
    func horizontalGradient(withColors colors: [CGColor])
    {
        let gradientLayer = gradientColors(colors: colors)
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.layer.addSublayer(gradientLayer)
    }
    
    func shadow(color: UIColor)
    {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.8
        
        self.layer.masksToBounds = false
    }
    
    func cornerWithShadowBackground(radius: CGFloat, color: UIColor)
    {
        shadow(color: color)
        self.layer.cornerRadius = radius
    }
    
    func cornerWithBorder(withColor color: UIColor, width: CGFloat, andRadius radius: CGFloat)
    {
        self.border(withColor: color, andWidth: width)
        self.cornerRadius(radius: radius)
    }
}
