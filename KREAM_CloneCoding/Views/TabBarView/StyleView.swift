//
//  StyleView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class StyleView: UIView {

    private let lbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Style입니다."
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI(){
        self.addSubview(lbl)
        self.backgroundColor = .white
        
        lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
