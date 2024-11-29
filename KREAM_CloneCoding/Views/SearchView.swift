//
//  SearchView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/11/24.
//

import UIKit

class SearchView: UIView {
    public let txtSearch = SearchTextField()
    
    public lazy var btnCancel = CancelButton()
    
    private let grpTopView = UIView()
    
    private let lblTitle = UILabel().then { lbl in
        lbl.text = "추천 검색어"
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    public let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 8
    })).then { view in
        view.isScrollEnabled = false
        view.register(RecommendSearchCollectionViewCell.self, forCellWithReuseIdentifier: RecommendSearchCollectionViewCell.id)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setSubView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubView(){
        [
            txtSearch,
            btnCancel
        ].forEach{ grpTopView.addSubview($0) }
        
        [
            grpTopView,
            lblTitle,
            collectionView
        ].forEach { self.addSubview($0) }
    }
    
    private func setUI(){
        self.backgroundColor = .white

        grpTopView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(57)
        }
        
        txtSearch.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(7)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(11)
        }
        
        btnCancel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(22)
            make.leading.equalTo(txtSearch.snp.trailing).offset(11)
            make.width.equalTo(25)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(grpTopView.snp.bottom).offset(30)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
        
    }
    
    public func setBorder(){
        let color = UIColor(hex: "#DDDDDD") ?? .white
        grpTopView.addBottomBorder(color: color, width: 0.5)
    }
}
