//
//  HomeHeaderView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 12/4/24.
//

import UIKit

class HomeHeaderView : UICollectionReusableView {
    static let id = "HomeHeaderView"
    
    private let lblTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
    }
    
    private let lblSubTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        lbl.textColor = UIColor(hex: "#878787")
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        lblTitle.text = nil
        lblSubTitle.text = nil
    }
    
    private func setUI(){
        [
            lblTitle,
            lblSubTitle
        ].forEach{self.addSubview($0)}
        
        lblTitle.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        lblSubTitle.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(4)
            make.leading.equalToSuperview()
        }
    }

    public func config(title: String, subTitle: String){
        lblTitle.text = title
        lblSubTitle.text = subTitle
    }
}
