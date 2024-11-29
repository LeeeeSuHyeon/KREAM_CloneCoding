//
//  DetailView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/27/24.
//

import UIKit

class DetailView: UIView {
    private lazy var mainImgView = UIImageView()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.itemSize = CGSize(width: 53, height: 53)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
    })).then { view in
        view.register(DetailViewCollectionViewCell.self, forCellWithReuseIdentifier: DetailViewCollectionViewCell.identifier)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
    }
    
    private lazy var lblTitle = UILabel().then { lbl in
        lbl.text = "즉시 구매가"
        lbl.font = .systemFont(ofSize: 12)
    }
    
    private lazy var lblPrice = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var lblItemName = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 16)
    }
    
    private lazy var lblItemDescrption = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = UIColor(hex: "#9C9C9C")
    }
    
    private lazy var grpBottomBtn = UIView()
    
    private lazy var grpPurchaseSellBtn = UIStackView().then { view in
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fillEqually
    }
    
    lazy var btnPurchase = UIButton().then { view in
        view.backgroundColor = UIColor(hex: "#EF6254")
        view.layer.cornerRadius = 10
    }
    
    private lazy var lblPurchaseTitle = UILabel().then { lbl in
        lbl.text = "구매"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .white
    }
    
    private lazy var lblPurchasePrice = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 13, weight: .bold)
        lbl.textColor = .white
    }
    
    private lazy var lblPurcahseSubTitle = UILabel().then { lbl in
        lbl.text = "즉시 구매가"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = UIColor(hex: "#A33723")
    }
    
    lazy var btnSell = UIButton().then { view in
        view.backgroundColor = UIColor(hex: "#41B97A")
        view.layer.cornerRadius = 10
    }
    
    private lazy var lblSellTitle = UILabel().then { lbl in
        lbl.text = "판매"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .white
    }
    
    private lazy var lblSellPrice = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 13, weight: .bold)
        lbl.textColor = .white
    }
    
    private lazy var lblSellSubTitle = UILabel().then { lbl in
        lbl.text = "즉시 판매가"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = UIColor(hex: "#A33723")
    }
    
    private lazy var grpSaved = UIView()
    
    lazy var btnSaved = UIButton().then { btn in
        btn.setImage(.tabBarSaved, for: .normal)
        btn.tintColor = .black
    }
    
    private lazy var lblSaved = UILabel().then { lbl in
        lbl.text = 2122.setWon()
        lbl.font = .systemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setSubView()
        setUI()
    }
    
    private func setSubView(){
        addSubview(mainImgView)
        addSubview(collectionView)
        addSubview(lblTitle)
        addSubview(lblPrice)
        addSubview(lblItemName)
        addSubview(lblItemDescrption)
        addSubview(grpBottomBtn)
        
        btnPurchase.addSubview(lblPurchaseTitle)
        btnPurchase.addSubview(lblPurchasePrice)
        btnPurchase.addSubview(lblPurcahseSubTitle)
        btnSell.addSubview(lblSellTitle)
        btnSell.addSubview(lblSellPrice)
        btnSell.addSubview(lblSellSubTitle)
        
        grpPurchaseSellBtn.addArrangedSubview(btnPurchase)
        grpPurchaseSellBtn.addArrangedSubview(btnSell)
        
        grpSaved.addSubview(btnSaved)
        grpSaved.addSubview(lblSaved)
        
        grpBottomBtn.addSubview(grpSaved)
        grpBottomBtn.addSubview(grpPurchaseSellBtn)
        
    }
    
    private func setUI(){
        mainImgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(373)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(mainImgView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(53)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(23)
            make.leading.equalToSuperview().inset(16)
        }
        
        lblPrice.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(4)
            make.leading.equalTo(lblTitle.snp.leading)
        }
        
        lblItemName.snp.makeConstraints { make in
            make.top.equalTo(lblPrice.snp.bottom).offset(18)
            make.leading.equalTo(lblTitle.snp.leading)
        }
        
        lblItemDescrption.snp.makeConstraints { make in
            make.top.equalTo(lblItemName.snp.bottom).offset(6)
            make.leading.equalTo(lblTitle.snp.leading)
        }
        
        grpBottomBtn.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(95)
        }
        
        grpSaved.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
        }
        
        btnSaved.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(26)
        }
        
        lblSaved.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(btnSaved.snp.bottom).offset(1)
        }
        
        grpPurchaseSellBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalTo(grpSaved.snp.trailing).offset(19)
            make.trailing.equalToSuperview().inset(10)
        }
        
        btnPurchase.snp.makeConstraints { make in
            make.width.equalTo(147)
            make.height.equalTo(49)
        }
        
        lblPurchaseTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        lblPurchasePrice.snp.makeConstraints { make in
            make.leading.equalTo(lblPurchaseTitle.snp.trailing).offset(21)
            make.top.equalToSuperview().inset(8)
        }
        
        lblPurcahseSubTitle.snp.makeConstraints { make in
            make.leading.equalTo(lblPurchasePrice.snp.leading)
            make.top.equalTo(lblPurchasePrice.snp.bottom).offset(2)
        }
        
        btnSell.snp.makeConstraints { make in
            make.width.equalTo(147)
            make.height.equalTo(49)
        }
        
        lblSellTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        lblSellPrice.snp.makeConstraints { make in
            make.leading.equalTo(lblSellTitle.snp.trailing).offset(21)
            make.top.equalToSuperview().inset(8)
        }
        
        lblSellSubTitle.snp.makeConstraints { make in
            make.leading.equalTo(lblSellPrice.snp.leading)
            make.top.equalTo(lblSellPrice.snp.bottom).offset(2)
        }
    }
    
    public func config(viewModel : DetailViewModel) {
        mainImgView.kf.setImage(with: URL(string: viewModel.image))
        lblSaved.text = viewModel.savedCount
        btnSaved.setImage(viewModel.isSaved ? .tabBarSelectedSaved : .tabBarSaved, for: .normal)
        lblPrice.text = viewModel.price
        lblItemName.text = viewModel.title
        lblItemDescrption.text = viewModel.description
        lblSellPrice.text = viewModel.sellPrice
        lblPurchasePrice.text = viewModel.purchasePrice
    }
    
    public func setTopBorder() {
        let lineColor = UIColor(hex: "#F3F3F3") ?? .black
        grpBottomBtn.addTopBorder(color: lineColor, width: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
