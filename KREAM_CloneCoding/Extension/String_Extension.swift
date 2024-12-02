//
//  String_Extension.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 12/2/24.
//

import UIKit

extension String {
    func getLabelWidth(fontSize : CGFloat, fontWeight : UIFont.Weight) -> CGFloat {
        let label = UILabel()
        label.text = self
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.sizeToFit()
        return label.frame.width
    }
}
