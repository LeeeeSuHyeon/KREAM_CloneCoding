//
//  SearchTextField.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit

class SearchTextField : UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setComponent(){
        self.placeholder = "브랜드, 상품, 프로필, 태그 등"
        self.backgroundColor = UIColor(hex: "#F5F5F5")
        self.layer.cornerRadius = 12
        self.font = .systemFont(ofSize: 13.5)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftViewMode = .always
    }
}
