//
//  HomeAdBannerCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 12/4/24.
//

import UIKit

class HomeAdBannerCell : UICollectionViewCell {
    static let id = "HomeAdBannerCell"
    
    private let imgView = UIImageView().then { view in
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
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
        self.imgView.image = nil
    }
    
    private func setUI(){
        addSubview(imgView)
        
        imgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func config(imageURL : String) {
        imgView.kf.setImage(with: URL(string: imageURL), placeholder: UIImage(named: "ad"))
    }
}
