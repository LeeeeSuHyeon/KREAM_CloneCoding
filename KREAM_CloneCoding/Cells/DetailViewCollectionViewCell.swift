//
//  DetailViewCollectionViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/27/24.
//

import UIKit

class DetailViewCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailViewCollectionViewCell"
    
    lazy var imageView = UIImageView().then { view in
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#E9E9E9")?.cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    private func setUI() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func config(image : UIImage) {
        imageView.image = image
    }

}
