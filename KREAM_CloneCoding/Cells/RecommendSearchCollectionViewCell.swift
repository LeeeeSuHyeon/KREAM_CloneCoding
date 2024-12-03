//
//  RecommendSearchCollectionViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit

class RecommendSearchCollectionViewCell: UICollectionViewCell {
    static let id = "RecommendSearchCollectionViewCell"
    
    private let lblTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 13)
        lbl.backgroundColor = UIColor(hex: "#F6F6F6")
        lbl.layer.cornerRadius = 20
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor(hex: "#ECECEC")?.cgColor
        lbl.clipsToBounds = true
        lbl.textAlignment = .center
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
    }
    
    private func setUI(){
        addSubview(lblTitle)
        
        lblTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    public func config(title : String) {
        lblTitle.text = title
    }
}
