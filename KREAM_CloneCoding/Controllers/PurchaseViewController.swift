//
//  PurchaseViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/2/24.
//

import UIKit

class PurchaseViewController: UIViewController {
    let item : HomeJustDropModel
    let viewModel : PurchaseViewModel
    
    var selectedItemIndex : Int?
    
    init(item: HomeJustDropModel) {
        self.item = item
        self.viewModel = PurchaseViewModel(item: item)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var purchaseView = PurchaseView()

    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseView.config(viewModel: viewModel)
        view = purchaseView
        setDataSource()
        setAction()

    }
    
    private func setDataSource(){
        self.purchaseView.collectionView.dataSource = self
        self.purchaseView.collectionView.delegate = self
    }
    
    private func setAction(){
        purchaseView.btnDismiss.addTarget(self, action: #selector(btnDismissDidTap), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        purchaseView.setTopBorder()
    }
    
    @objc func btnDismissDidTap() {
        dismiss(animated: true)
    }
}


extension PurchaseViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.sizes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PurchaseCollectionViewCell.identifier, for: indexPath) as? PurchaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        let _ = item.sizes?[indexPath.row].map { size, price in
            cell.config(size: size, price: price)
        }
        
        if indexPath.row == selectedItemIndex {
            cell.setBoldCell()
        } else {
            cell.setBasicCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedItemIndex = indexPath.row
        
        collectionView.reloadData()
    }
}
