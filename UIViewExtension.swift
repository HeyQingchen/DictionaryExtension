//
//  UIViewExtension.swift
//
//  Created by HeyQingchen on 16/6/1.
//

import Foundation
import CoreGraphics
import ObjectiveC

extension UIView {

  @objc func imageFromCurrentView() -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale)
    if let context = UIGraphicsGetCurrentContext() {
      self.layer.render(in: context)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return image
    }
    return nil
  }

  @objc func addDashedBorder(strokeColor: UIColor, lineWidth: CGFloat) {
    let shapeLayer = CAShapeLayer()
    shapeLayer.name = "DashedTopLine"
    shapeLayer.bounds = bounds
    shapeLayer.position = CGPoint(x: frame.width, y: frame.height / 2)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = strokeColor.cgColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.lineJoin = kCALineJoinRound
    shapeLayer.lineDashPattern = [2, 4]

    let path = CGMutablePath()
    path.move(to: CGPoint.zero)
    path.addLine(to: CGPoint(x: 0, y: frame.height))
    shapeLayer.path = path

    layer.addSublayer(shapeLayer)
  }
}
