//
//  UIView_Extension.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/19/24.
//

import Foundation
import UIKit

extension UIView {
    func addTopBorder(color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
//        border.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: width)
        border.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: width)
        self.addSubview(border)
    }
    
    func addBottomBorder(color : UIColor, width : CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: self.frame.minX, y: self.frame.height, width: self.bounds.width, height: width)
        self.addSubview(border)
    }
}
