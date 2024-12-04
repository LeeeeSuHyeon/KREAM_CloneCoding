//
//  HomeFooterView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 12/4/24.
//

import UIKit

class HomeFooterView : UICollectionReusableView {
    static let id = "HomeFooterView"
    
    private let lineView = UIView().then { view in
        view.backgroundColor = UIColor(hex: "#F2F2F2")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(lineView)
        
        lineView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}

