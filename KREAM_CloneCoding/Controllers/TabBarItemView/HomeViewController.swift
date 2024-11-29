//
//  HomeViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class HomeViewController: UIViewController {
    let data = HomeCVModel.dummy()
    let justDropItems = HomeJustDropModel.dummy()
    let happyLookItems = HomeHappyLookModel.dummy()

    private lazy var homeView = HomeView()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView

        setupAction()
        setupDelegate()
        
    }
    
    private func setupDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        homeView.justDropCollectionView.delegate = self
        homeView.justDropCollectionView.dataSource = self
        homeView.happyLookCollectionView.dataSource = self
    }
    
    
    private func setupAction() {
        homeView.txtSearch.addTarget(self, action: #selector(txtSearchDidTap), for: .editingDidBegin)
        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment : )), for: .valueChanged)
    }
    
    @objc func txtSearchDidTap() {
        let nextVC = SearchViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
    @objc private func segmentedControlValueChanged(segment : UISegmentedControl){
        switch segment.selectedSegmentIndex {
        case 0 :
            homeView.scrollView.isHidden = false
        default:
            homeView.scrollView.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeView.setTapBorder()
    }
    
}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case homeView.collectionView :
            return data.count
        case homeView.justDropCollectionView :
            return justDropItems.count
        case homeView.happyLookCollectionView :
            return happyLookItems.count
        default:
            return data.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case homeView.collectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imgView.image = data[indexPath.row].image
            cell.lblTitle.text = data[indexPath.row].title
            
            return cell
            
        case homeView.justDropCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeJustDropCollectionViewCell.identifier, for: indexPath) as? HomeJustDropCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.config(item: justDropItems[indexPath.row])
            return cell
        case homeView.happyLookCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHappyLookCVCell.identifier, for: indexPath) as? HomeHappyLookCVCell
            else {
                return UICollectionViewCell()
            }
            cell.config(item: happyLookItems[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case homeView.justDropCollectionView :
            let nextVC = DetailViewController(item: justDropItems[indexPath.row])
            nextVC.hidesBottomBarWhenPushed = true
            self.navigationController?.navigationBar.isHidden = false
            navigationController?.pushViewController(nextVC, animated: true)
        default:
            return
        }
    }
}
