//
//  RecommendSearchCollectionViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit

class RecommendSearchCollectionViewCell: UICollectionViewCell {
    static let id = "RecommendSearchCollectionViewCell"
    
    private let btnTitle = UIButton().then { btn in
        btn.backgroundColor = UIColor(hex: "#F6F6F6")
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(hex: "#ECECEC")?.cgColor
        btn.clipsToBounds = true
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(btnTitle)
        
        btnTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    public func config(title : String) {
        btnTitle.setTitle(title, for: .normal)
        btnTitle.setTitleColor(.black, for: .normal)
        btnTitle.titleLabel?.font = .systemFont(ofSize: 13)
    }
}
