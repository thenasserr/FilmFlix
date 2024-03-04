//
//  UIView+Ext.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import UIKit

extension UIView {
    
    // MARK: - Custom shape for the details
    func detailsCustomShape() {
        // Set the corner radius for the rounded corners
        let cornerRadius: CGFloat = 25.0
        let ySpace: CGFloat = 65
        let xSpace: CGFloat = 100
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        // Move to the starting point and add a quadratic curve for the top-left corner
        path.move(to: CGPoint(x: bounds.minX, y: bounds.minY + ySpace))
        
        path.addLine(to: CGPoint(x: bounds.minX + xSpace - cornerRadius, 
                                 y: bounds.minY + ySpace))
        path.addQuadCurve(to: CGPoint(x: bounds.minX + xSpace, 
                                      y: bounds.minY + ySpace - cornerRadius),
                          controlPoint: CGPoint(x: bounds.minX + xSpace,
                                                y: bounds.minY + ySpace))
        
        path.addLine(to: CGPoint(x: bounds.minX + xSpace, 
                                 y: bounds.minY + cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.minX + xSpace + cornerRadius, 
                                      y: bounds.minY), 
                          controlPoint: CGPoint(x: bounds.minX + xSpace, y: bounds.minY))
        
        path.addLine(to: CGPoint(x: bounds.maxX - xSpace - cornerRadius, y: bounds.minY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - xSpace, y: bounds.minY + cornerRadius), controlPoint: CGPoint(x: bounds.maxX - xSpace, y: bounds.minY))
        
        path.addLine(to: CGPoint(x: bounds.maxX - xSpace, 
                                 y: bounds.minY + ySpace - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - xSpace + cornerRadius, 
                                      y: bounds.minY + ySpace),
                          controlPoint: CGPoint(x: bounds.maxX - xSpace,
                                                y: bounds.minY + ySpace))
        
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.minY + ySpace))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX, y: bounds.minY + ySpace + cornerRadius), controlPoint: CGPoint(x: bounds.maxX, y: bounds.minY + ySpace))
        
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.maxY), controlPoint: CGPoint(x: bounds.maxX, y: bounds.maxY))
        
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.minX, y: bounds.maxY - cornerRadius), controlPoint: CGPoint(x: bounds.minX, y: bounds.maxY))
        
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY + ySpace + cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.minY + ySpace), controlPoint: CGPoint(x: bounds.minX, y: bounds.minY + ySpace))
        
        path.close()
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 20, height: 20)
        layer.shadowRadius = CGFloat(10)
        layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.red.cgColor
    }
    
    // MARK: - Custom shape for poster Image
    func posterCustomShape() {
        // Set the corner radius for the rounded corners
        let cornerRadius: CGFloat = 25.0
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        // Move to the starting point and add a quadratic curve for the top-left corner
        path.move(to: CGPoint(x: bounds.minX, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: bounds.minY), controlPoint: CGPoint(x: bounds.minX, y: bounds.minY))
        
        // Add a line and quadratic curve for the top-right corner
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.minY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX, y: cornerRadius), controlPoint: CGPoint(x: bounds.maxX, y: bounds.minY))
        //
        // Add a line and quadratic curve for the (bottom-right - space) corner
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.maxY), controlPoint: CGPoint(x: bounds.maxX, y: bounds.maxY))
        
        // Add a line and quadratic curve for the (bottom-right - space) corner
        path.addLine(to: CGPoint(x: bounds.maxX - 55, y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - 85, y: bounds.maxY - 3), controlPoint: CGPoint(x: bounds.maxX - 85, y: bounds.maxY))
        
        path.addLine(to: CGPoint(x: bounds.maxX - 110, y: bounds.maxY - 40))
        path.addLine(to: CGPoint(x: bounds.maxX - 260, y: bounds.maxY - 40))
        
        path.addLine(to: CGPoint(x: bounds.maxX - 280, y: bounds.maxY - 3))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - 300, y: bounds.maxY), controlPoint: CGPoint(x: bounds.maxX - 280, y: bounds.maxY))
        
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.minX, y: bounds.maxY - cornerRadius), controlPoint: CGPoint(x: bounds.minX, y: bounds.maxY))
        
        path.close()
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.masksToBounds = true
        layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.red.cgColor
    }
}
