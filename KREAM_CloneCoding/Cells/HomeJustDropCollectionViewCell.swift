//
//  HomeJustDropCollectionViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/19/24.
//

import UIKit

class HomeJustDropCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeJustDropCollectionViewCell"
    
    private lazy var imageView = UIImageView().then { view in
        view.contentMode = .scaleAspectFit
    }
    
    private lazy var lblDeal = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 10)
    }
    
    private lazy var btnSaved = UIButton().then { btn in
        btn.tintColor = .black
    }
    
    private lazy var lblTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.lineBreakMode = .byTruncatingTail
        lbl.numberOfLines = 1
    }
    
    private lazy var lblSubTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 12)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 2
    }
    
    private lazy var lblPrice = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 13, weight: .bold)
        lbl.numberOfLines = 1
    }
    
    private lazy var lblOrder = UILabel().then { lbl in
        lbl.text = "즉시 구매가"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = UIColor(hex: "#A2A2A2")
    }
    
    private lazy var grpDescription = UIView().then { view in
        
    }
    
    private func setUI(){
        grpDescription.addSubview(lblTitle)
        grpDescription.addSubview(lblSubTitle)
        grpDescription.addSubview(lblPrice)
        grpDescription.addSubview(lblOrder)
        
        addSubview(imageView)
        addSubview(lblDeal)
        addSubview(btnSaved)
        addSubview(grpDescription)
        
        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width)
        }
        
        lblDeal.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(8)
            make.trailing.equalTo(imageView.snp.trailing).offset(-8)
        }
        
        btnSaved.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(16)
            make.bottom.equalTo(imageView.snp.bottom).offset(-10)
            make.trailing.equalTo(imageView.snp.trailing).offset(-10)
        }
        
        grpDescription.snp.makeConstraints { make in
            make.height.equalTo(87)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(4)
            make.width.equalTo(124)
//            make.bottom.equalToSuperview()
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        lblSubTitle.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(3)
            make.trailing.leading.equalToSuperview()
        }
        
        lblPrice.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(lblOrder.snp.top).offset(-2)
        }
        
        lblOrder.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(item : HomeJustDropModel) {
        imageView.kf.setImage(with: URL(string: item.image), placeholder: UIImage(named: "jordan"))
        lblTitle.text = item.title
        lblSubTitle.text = item.subTitle
        lblDeal.text = "거래 \(item.dealCount)만"
        lblPrice.text = item.price.setWon() + "원"
        btnSaved.setImage(item.isSaved ? .justDropBookmarkFill : .justDropBookmark, for: .normal)
    }
}
