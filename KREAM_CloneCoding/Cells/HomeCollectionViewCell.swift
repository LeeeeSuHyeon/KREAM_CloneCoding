//
//  HomeCollectionViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/11/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    private lazy var imgView = UIImageView().then { view in
        view.contentMode = .scaleAspectFit
    }
    
    private lazy var lblTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 11.5)
        lbl.textColor = .black
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
        imgView.image = nil
    }
    
    private func setUI() {
        addSubview(imgView)
        addSubview(lblTitle)
        
        imgView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(self.snp.width)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    public func config(image : UIImage, title : String){
        imgView.image = image
        lblTitle.text = title
    }

}
