//
//  HomeViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let bannerItems = HomeAdModel.dummy()
    private let recommendationItems = HomeRecommendationModel.dummy()
    private let justDropItems = HomeJustDropModel.dummy()
    private let happyLookItems = HomeHappyLookModel.dummy()
    
    private var dataSource : UICollectionViewDiffableDataSource<Section, Item>?
    
    private lazy var homeView = HomeView()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        setDataSource()
        setSnapShot()
        setupAction()
    }
    
    
    
    private func setupAction() {
        homeView.txtSearch.addTarget(self, action: #selector(txtSearchDidTap), for: .editingDidBegin)
//        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment : )), for: .valueChanged)
    }
    
    @objc func txtSearchDidTap() {
        let nextVC = SearchViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    private func setDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: homeView.collectionView, cellProvider: { collectionView, indexPath, item in
            switch item {
            case .bannerItem(let items):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeAdBannerCell.id, for: indexPath) as? HomeAdBannerCell else {
                    return UICollectionViewCell()
                }
                cell.config(imageURL: items.imageURL)
                return cell
            case .recommendationItem(let items):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecmmendationCell.identifier, for: indexPath) as? HomeRecmmendationCell else {
                    return UICollectionViewCell()
                }
                cell.config(image: items.image, title: items.title)
                return cell
            case .productItem(let items) :
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeJustDropCollectionViewCell.identifier, for: indexPath) as? HomeJustDropCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.config(item: items)
                return cell
            case .userStoryItem(let items) :
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHappyLookCVCell.identifier, for: indexPath) as? HomeHappyLookCVCell else {
                    return UICollectionViewCell()
                }
                cell.config(item: items)
                return cell
            }
        })
        
        
        dataSource?.supplementaryViewProvider = {[weak self] collectionView, kind, indexPath in
            let section = self?.dataSource?.sectionIdentifier(for: indexPath.section)
            switch section {
            case .banner:
                return self?.getReusableView(collectionView: collectionView, kind: kind, indexPath: indexPath)
            case .recommendation:
                return self?.getReusableView(collectionView: collectionView, kind: kind, indexPath: indexPath)
            case .product(let headerInfo):
                return self?.getReusableView(collectionView: collectionView, kind: kind, indexPath: indexPath, headerInfo: headerInfo)
            case .userStory(let headerInfo):
                return self?.getReusableView(collectionView: collectionView, kind: kind, indexPath: indexPath, headerInfo: headerInfo)
            default :
                return UICollectionReusableView()
            }
        }
        
        if let dataSource = dataSource {
            homeView.config(dataSource: dataSource)
        }
    }
    
    
    private func getReusableView(collectionView: UICollectionView, kind: String, indexPath: IndexPath, headerInfo: HeaderInfo? = nil) -> UICollectionReusableView{
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeHeaderView.id, for: indexPath) as? HomeHeaderView, let headerInfo = headerInfo
            else {
                return UICollectionReusableView()
            }
            header.config(title: headerInfo.title, subTitle: headerInfo.subTitle)
            return header
            
        case UICollectionView.elementKindSectionFooter :
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeFooterView.id, for: indexPath) as? HomeFooterView else {
                return UICollectionReusableView()
            }
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    private func setSnapShot(){
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        let bannerSection = Section.banner
        let bannerItem = bannerItems.map{Item.bannerItem($0)}
        
        let recommendationSection = Section.recommendation
        let recommendationItem = recommendationItems.map{Item.recommendationItem($0)}
        
        let productHeader = HeaderInfo(title: "Just Dropped", subTitle: "발매 상품")
        let productSection = Section.product(productHeader)
        let productItem = justDropItems.map{Item.productItem($0)}
        
        let userStoryHeader = HeaderInfo(title: "본격 한파대비! 연말 필수템 모음", subTitle: "#해피홀리룩챌린지")
        let userStorySection = Section.userStory(userStoryHeader)
        let userStoryItem = happyLookItems.map{Item.userStoryItem($0)}
        
        snapShot.appendSections([bannerSection, recommendationSection, productSection, userStorySection])
        
        snapShot.appendItems(bannerItem, toSection: bannerSection)
        snapShot.appendItems(recommendationItem, toSection: recommendationSection)
        snapShot.appendItems(productItem, toSection: productSection)
        snapShot.appendItems(userStoryItem, toSection: userStorySection)
        
        self.dataSource?.apply(snapShot)
    }
}
