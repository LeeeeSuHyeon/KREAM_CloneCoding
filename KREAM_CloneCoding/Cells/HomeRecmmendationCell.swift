//
//  HomeRecmmendationCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/11/24.
//

import UIKit

class HomeRecmmendationCell: UICollectionViewCell {
    static let identifier = "HomeRecmmendationCell"
    
    private var imgView = UIImageView().then { view in
        view.contentMode = .scaleAspectFit
    }
    
    private var lblTitle = UILabel().then { lbl in
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
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(self.snp.width)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    public func config(image : UIImage, title : String){
        imgView.image = image
        lblTitle.text = title
    }

}
