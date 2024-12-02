//
//  SavedTableViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/7/24.
//

import UIKit

class SavedCell: UITableViewCell {
    static let identifier = "SavedCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubView()
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
        lblPrice.text = nil
        lblTitle.text = nil
        lblDescription.text = nil
    }
    
    private var emptySpace = UIView()
    
    // 셀의 이미지 뷰
    private var imgView = UIImageView().then { view in
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
    }
    
    // 타이틀
    private var lblTitle = UILabel().then { title in
        title.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    // 설명
    private var lblDescription = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 9)
        lbl.textColor = UIColor(hex: "#A1A1A1")
        lbl.numberOfLines = 2   // 라인 수 지정
    }
    
    // 가격
    private var lblPrice = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    // 저장 버튼
    private var btnSaved = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        
        config.image = UIImage(systemName: "bookmark.fill")
        config.image?.withTintColor(.black)
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        
        btn.configuration = config
        
        btn.imageView?.contentMode = .scaleAspectFit
        btn.clipsToBounds = true
    }
    
    // 타이틀, 설명 그룹
    private var grpLabel = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .leading
    }
    
    private func setSubView(){
        [
            lblTitle,
            lblDescription
        ].forEach{grpLabel.addArrangedSubview($0)}
        
        [
            emptySpace,
            imgView,
            grpLabel,
            btnSaved,
            lblPrice
        ].forEach{self.addSubview($0)}
    }
    
    private func setUI() {
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(72)
            make.leading.top.equalToSuperview().offset(13)
        }
        
        grpLabel.snp.makeConstraints { make in
            make.width.equalTo(153)
            make.leading.equalTo(imgView.snp.trailing).offset(13)
            make.top.equalTo(imgView)
        }
        
        btnSaved.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(18)
            make.top.trailing.equalToSuperview().inset(18)
        }
        
        lblPrice.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(18)
            make.bottom.equalTo(imgView)
        }
    }
    
    public func configure(model : SavedCellModel){
        self.imgView.image = UIImage(named: model.image)?.withRenderingMode(.alwaysOriginal)
        self.lblTitle.text = model.title
        self.lblDescription.text = model.description
        self.lblPrice.text = model.price.getWonString()
    }

}
