//
//  CancelButton.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit


class CancelButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    private func setButton() {
        self.setTitle("취소", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
