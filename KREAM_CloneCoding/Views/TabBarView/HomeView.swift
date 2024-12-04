//
//  HomeView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit




class HomeView: UIView {
    private var dataSource : UICollectionViewDiffableDataSource<Section, Item>?
    public var txtSearch = SearchTextField()
    
    public var btnAlert = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.image = .iconAlert
        config.image?.withTintColor(.black)
        
        btn.configuration = config
        btn.contentMode = .scaleAspectFit
    }
    
    private var grpTopSearchAlert = UIStackView().then { view in
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 15
    }
    
    public var segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "력셔리", "남성", "여성"]).then { sc in
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
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout()).then { view in
        view.register(HomeAdBannerCell.self, forCellWithReuseIdentifier: HomeAdBannerCell.id)
        view.register(HomeRecmmendationCell.self, forCellWithReuseIdentifier: HomeRecmmendationCell.identifier)
        view.register(HomeJustDropCollectionViewCell.self, forCellWithReuseIdentifier: HomeJustDropCollectionViewCell.identifier)
        view.register(HomeHappyLookCVCell.self, forCellWithReuseIdentifier: HomeHappyLookCVCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 10
        
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            let section = self?.dataSource?.sectionIdentifier(for: sectionIndex)
            switch section {
            case .banner:
                return self?.createBannerSection()
            case .recommendation:
                return self?.createRecommendationSection()
            case .product:
                return self?.createProductSection()
            case .userStory:
                return self?.createUserStorySection()
            case .none:
                return self?.createBannerSection()
            }
            
        }, configuration: config)
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(self.bounds.width))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func createRecommendationSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(81))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 한 줄 당 하나의 그룹
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(91))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)

        return section
    }
    
    private func createProductSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(142), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 하나의 아이템이 하나의 그룹
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(152), heightDimension: .absolute(237))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        return section
    }
    
    private func createUserStorySection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(124), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(130), heightDimension: .absolute(165))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        return section
    }
    
    private func setSubView(){
        [
            grpTopSearchAlert,
            segmentedControl,
            collectionView
        ].forEach{self.addSubview($0)}

        [
            txtSearch,
            btnAlert
        ].forEach{grpTopSearchAlert.addArrangedSubview($0)}
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    public func config(dataSource : UICollectionViewDiffableDataSource<Section, Item>){
        self.dataSource = dataSource
    }
}
