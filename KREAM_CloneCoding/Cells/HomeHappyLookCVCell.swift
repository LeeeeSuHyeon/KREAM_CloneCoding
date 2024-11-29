//
//  HomeHappyLookCVell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/20/24.
//

import UIKit
import Kingfisher

class HomeHappyLookCVCell: UICollectionViewCell {
    static let identifier = "HomeHappyLookCVCell"
    
    public lazy var imgView = UIImageView().then { view in
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFill
        
    }
    
    public lazy var lblId = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 12, weight: .semibold)
        lbl.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    private func setUI() {
        addSubview(imgView)
        addSubview(lblId)
        
        imgView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.equalTo(124)
            make.height.equalTo(165)
        }
        
        lblId.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(11)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(item : HomeHappyLookModel) {
        imgView.kf.setImage(with: URL(string: item.image), placeholder: UIImage(named: "look1"))
        lblId.text = item.id
    }
    
}
