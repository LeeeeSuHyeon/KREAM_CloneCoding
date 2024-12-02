//
//  SearchViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/11/24.
//

import UIKit

class SearchViewController: UIViewController {

    let searchView = SearchView()
    let items = RecommendSearchModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
        
        setAction()
        setProtocol()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchView.setBorder()
    }
    
    private func setAction() {
        searchView.btnCancel.addTarget(self, action: #selector(didTapBtnPop), for: .touchUpInside)
        searchView.txtSearch.addTarget(self, action: #selector(didTapTextSearch), for: .editingDidBegin)
    }
    
    private func setProtocol() {
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
    }
    
    @objc func didTapBtnPop() {
        self.dismiss(animated: true)
    }
    
    @objc func didTapTextSearch() {
        let nextVC = SearchDetailViewController()
        nextVC.modalPresentationStyle = .currentContext
        self.present(nextVC, animated: true)
    }
}


extension SearchViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendSearchCollectionViewCell.id, for: indexPath) as? RecommendSearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.config(title: items[indexPath.row].title)
        return cell
    }
}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = items[indexPath.row].title.getLabelWidth(fontSize: 13, fontWeight: .regular)
        let padding : CGFloat = 20
        return CGSize(width: width + padding, height: 32)
    }
}
