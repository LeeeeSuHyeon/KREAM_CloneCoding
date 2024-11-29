//
//  PurchaseView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/2/24.
//

import UIKit

class PurchaseView: UIView {
    
    private lazy var lblTitle = UILabel().then { lbl in
        lbl.text = "구매하기"
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private lazy var lblSubTitle = UILabel().then { lbl in
        lbl.text = "(가격 단위: 원)"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = UIColor(hex: "#929292")
    }
    
    lazy var btnDismiss = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "xmark")
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        
        btn.configuration = config
        btn.tintColor = .black
    }
    
    private lazy var imageView = UIImageView()
    
    private lazy var lblItemName = UILabel().then { lbl in
        lbl.text = "lblItemName"
        lbl.font = .systemFont(ofSize: 14)
    }
    
    private lazy var lblItemDescription = UILabel().then { lbl in
        lbl.text = "lblItemDescription"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = UIColor(hex: "#9C9C9C")
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.itemSize = CGSize(width: 110, height: 47)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 7
    })).then { view in
        view.register(PurchaseCollectionViewCell.self, forCellWithReuseIdentifier: PurchaseCollectionViewCell.identifier)
        view.backgroundColor = .clear
        view.isScrollEnabled = false
    }
    
    private lazy var grpBottomView = UIView()
    private lazy var grpBottomStackView = UIStackView().then { view in
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fillEqually
    }
    
    lazy var btnExpressDelivery = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        
        config.title = "123123"
        var attributedTitle = AttributedString(config.title ?? "")
        attributedTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        config.subtitle = "빠른 배송(1-2일 소요)"
        var attributedSubTitle = AttributedString(config.subtitle ?? "")
        attributedSubTitle.font = UIFont.systemFont(ofSize: 10)
        attributedSubTitle.foregroundColor = UIColor(hex: "#FFCAB9")
        
        config.attributedTitle = attributedTitle
        config.attributedSubtitle = attributedSubTitle
        config.titleAlignment = .center
        
        btn.configuration = config
        btn.backgroundColor = UIColor(hex: "#EF6254")
        btn.layer.cornerRadius = 10
        btn.tintColor = .white
    }
    
    lazy var btnNormalDelivery = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "123123"
        var attributedTitle = AttributedString(config.title ?? "")
        attributedTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        config.subtitle = "일반 배송(5-7일 소요)"
        var attributedSubTitle = AttributedString(config.subtitle ?? "")
        attributedSubTitle.font = UIFont.systemFont(ofSize: 10)
        attributedSubTitle.foregroundColor = UIColor(hex: "#E2E2E2")
        
        config.attributedTitle = attributedTitle
        config.attributedSubtitle = attributedSubTitle
        config.titleAlignment = .center
        
        btn.configuration = config
        btn.backgroundColor = UIColor(hex: "#222222")
        btn.layer.cornerRadius = 10
        btn.tintColor = .white
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setSubView()
        setUI()
    }
    
    private func setSubView() {
        [lblTitle,
         lblSubTitle,
         btnDismiss,
         imageView,
         lblItemName,
         lblItemDescription,
         collectionView,
         grpBottomView
        ].forEach { view in
            addSubview(view)
        }
        
        grpBottomStackView.addArrangedSubview(btnExpressDelivery)
        grpBottomStackView.addArrangedSubview(btnNormalDelivery)
        
        grpBottomView.addSubview(grpBottomStackView)
    }
    
    private func setUI(){
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        lblSubTitle.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        btnDismiss.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(12)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(61)
            make.width.height.equalTo(91)
        }
        
        lblItemName.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.top.equalTo(imageView.snp.top).offset(18)
        }
        
        lblItemDescription.snp.makeConstraints { make in
            make.leading.equalTo(lblItemName.snp.leading)
            make.top.equalTo(lblItemName.snp.bottom).offset(4)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.bottom.equalTo(grpBottomView.snp.top)
        }
        
        grpBottomView.snp.makeConstraints { make in
            make.height.equalTo(101)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        grpBottomStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        btnExpressDelivery.snp.makeConstraints { make in
            make.height.equalTo(52)
        }
        
        btnNormalDelivery.snp.makeConstraints { make in
            make.height.equalTo(52)
        }
    }
    
    public func config(viewData : PurchaseViewData){
        imageView.kf.setImage(with: URL(string: viewData.image))
        lblItemName.text = viewData.title
        lblItemDescription.text = viewData.desription
        
        var attributedExpressTitle = AttributedString(viewData.expressedDeliveryPrice)
        attributedExpressTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btnExpressDelivery.configuration?.attributedTitle = attributedExpressTitle
        
        
        var attributedNormalTitle = AttributedString(viewData.normalDeliveryPrice)
        attributedNormalTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btnNormalDelivery.configuration?.attributedTitle = attributedNormalTitle
    }
    
    public func setTopBorder(){
        let lineColor = UIColor(hex: "#F3F3F3") ?? .black
        grpBottomView.addTopBorder(color: lineColor, width: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
