//
//  HomeView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class HomeView: UIView {
    public lazy var txtSearch = SearchTextField()
    
    public lazy var btnAlert = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.image = .iconAlert
        config.image?.withTintColor(.black)
        
        btn.configuration = config
        btn.contentMode = .scaleAspectFit
    }
    
    public lazy var grpTopSearchAlert = UIStackView().then { view in
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 15
    }
    
    public lazy var segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "력셔리", "남성", "여성"]).then { sc in
        sc.selectedSegmentIndex = 0
        sc.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        sc.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        sc.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        sc.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black,
                                   .font : UIFont.systemFont(ofSize: 16, weight: .regular),
                                   .baselineOffset : 10,
        ], for: .normal)
        
        
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black,
                                   .font : UIFont.systemFont(ofSize: 16, weight: .bold),
                                   .underlineStyle : NSUnderlineStyle.thick.rawValue,
                                   .baselineOffset : 10,

                                   
        ], for: .selected)
        
        sc.apportionsSegmentWidthsByContent = true
    }
    
    public lazy var scrollView = UIScrollView()
    
    private lazy var contentView = UIView()
    
    public lazy var imgViewAd = UIImageView().then { view in
        view.image = .ad.withRenderingMode(.alwaysOriginal)
        view.contentMode = UIView.ContentMode.scaleAspectFill // 추가
    }
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.itemSize = CGSize(width: 61, height: 81)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 9
    })
    ).then { view in
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        view.isScrollEnabled = false
        view.backgroundColor = .clear
    }
    
    public lazy var grpJustDrop = UIView()
    
    private lazy var lblJustDropTitle = UILabel().then { lbl in
        lbl.text = "Just Dropped"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
    }
    
    private lazy var lblJustDropSubTitle = UILabel().then { lbl in
        lbl.text = "발매 상품"
        lbl.font = .systemFont(ofSize: 13)
        lbl.textColor = UIColor(hex: "#878787")
    }
    
    public lazy var justDropCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
//        layout.estimatedItemSize = CGSize(width: 142, height: 237)
        layout.itemSize = CGSize(width: 142, height: 237)
        
    })).then { view in
        view.register(HomeJustDropCollectionViewCell.self, forCellWithReuseIdentifier: HomeJustDropCollectionViewCell.identifier)
        view.backgroundColor = .clear
    }
    
    public lazy var grpHappyLook = UIView()
    
    private lazy var lblHappyLookTitle = UILabel().then { lbl in
        lbl.text = "본격 한파대비! 연말 필수템 모음"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
    }
    
    private lazy var lblHappyLookSubTitle = UILabel().then { lbl in
        lbl.text = "#해피홀리룩챌린지"
        lbl.font = .systemFont(ofSize: 13)
        lbl.textColor = UIColor(hex: "#878787")
    }
    
    public lazy var happyLookCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ layout in
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 124, height: 165)
        
    })).then { view in
        view.register(HomeHappyLookCVCell.self, forCellWithReuseIdentifier: HomeHappyLookCVCell.identifier)
        view.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubView()
        setUI()
    }
    
    private func setSubView(){
        addSubview(grpTopSearchAlert)
        addSubview(segmentedControl)
        addSubview(scrollView)
        
        grpTopSearchAlert.addArrangedSubview(txtSearch)
        grpTopSearchAlert.addArrangedSubview(btnAlert)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imgViewAd)
        contentView.addSubview(collectionView)
        contentView.addSubview(grpJustDrop)
        contentView.addSubview(grpHappyLook)
        
        grpJustDrop.addSubview(lblJustDropTitle)
        grpJustDrop.addSubview(lblJustDropSubTitle)
        grpJustDrop.addSubview(justDropCollectionView)
        
        grpHappyLook.addSubview(lblHappyLookTitle)
        grpHappyLook.addSubview(lblHappyLookSubTitle)
        grpHappyLook.addSubview(happyLookCollectionView)
    }
    
    private func setUI(){
        self.backgroundColor = .white

        
        grpTopSearchAlert.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(grpTopSearchAlert.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(27)
        }
        
        txtSearch.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(40)
        }
        
        btnAlert.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.equalTo(happyLookCollectionView.snp.bottom).offset(50) // 하단 여유 추가
        }

        imgViewAd.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(336)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(imgViewAd.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(182)
        }
        
        
        grpJustDrop.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        lblJustDropTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(collectionView.snp.leading)
        }
        
        lblJustDropSubTitle.snp.makeConstraints { make in
            make.top.equalTo(lblJustDropTitle.snp.bottom).offset(8)
            make.leading.equalTo(collectionView.snp.leading)
        }
        
        justDropCollectionView.snp.makeConstraints { make in
            make.top.equalTo(lblJustDropSubTitle.snp.bottom).offset(14)
            make.leading.equalTo(collectionView.snp.leading)
            make.trailing.equalToSuperview()
            make.height.equalTo(237)
            make.bottom.equalToSuperview() // 그룹 뷰의 하단에 맞춤
        }
        
        grpHappyLook.snp.makeConstraints { make in
            make.top.equalTo(grpJustDrop.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        lblHappyLookTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(collectionView.snp.leading)
        }
        
        lblHappyLookSubTitle.snp.makeConstraints { make in
            make.top.equalTo(lblHappyLookTitle.snp.bottom).offset(8)
            make.leading.equalTo(collectionView.snp.leading)
        }
        
        happyLookCollectionView.snp.makeConstraints { make in
            make.top.equalTo(lblHappyLookSubTitle.snp.bottom).offset(14)
            make.trailing.equalToSuperview()
            make.leading.equalTo(collectionView.snp.leading)
            make.height.equalTo(165)
            make.bottom.equalToSuperview() // 그룹 뷰의 하단에 맞춤
        }
    }
    
    public func setTapBorder(){
        let lineColor = UIColor(hex: "#F2F2F2") ?? .blue
        grpJustDrop.addTopBorder(color: lineColor, width: 1)
        grpHappyLook.addTopBorder(color: lineColor, width: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
