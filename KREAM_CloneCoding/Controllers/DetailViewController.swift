//
//  DetailViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/2/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    let item : HomeJustDropModel
    var viewModel : DetailViewModel
    init(item: HomeJustDropModel) {
        self.item = item
        self.viewModel = DetailViewModel(item: item)
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        detailView.config(viewModel: viewModel)
        setDelegate()
        setAction()
    }
    
    private func setAction() {
        
        // dismiss 버튼
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(popAction))
        leftItem.tintColor = UIColor(hex: "#848484")
        navigationItem.setLeftBarButton(leftItem, animated: true)
        
        detailView.btnPurchase.addTarget(self, action: #selector(btnPurchaseDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        detailView.collectionView.dataSource = self
        detailView.collectionView.delegate = self
    }
    
    // 뒤로 가기 버튼
    @objc func popAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func btnPurchaseDidTap() {
        let nextVC = PurchaseViewController(item: item)
        nextVC.modalPresentationStyle = .pageSheet
        present(nextVC, animated: true)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.setTopBorder()
    }

}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.simiarItemImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCollectionViewCell.identifier, for: indexPath) as? DetailViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.config(image: item.simiarItemImage[indexPath.row])
        
        return cell
    }
}
