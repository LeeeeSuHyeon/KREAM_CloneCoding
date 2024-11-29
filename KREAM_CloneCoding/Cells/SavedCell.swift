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
        
        setStackView()
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    // 셀의 이미지 뷰
    public lazy var imgView = UIImageView().then { view in
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // 타이틀
    public lazy var lblTitle = UILabel().then { title in
        title.font = .systemFont(ofSize: 12, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 설명
    public lazy var lblDescription = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 9)
        lbl.textColor = UIColor(hex: "#A1A1A1")
        lbl.numberOfLines = 2   // 라인 수 지정
//        lbl.lineBreakMode = .byWordWrapping // 라인 넘길 때 단어 기준으로 넘김
        lbl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 가격
    public lazy var lblPrice = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    // 저장 버튼
    public lazy var btnSaved = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        
        config.image = UIImage(systemName: "bookmark.fill")
        config.image?.withTintColor(.black)
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        
        btn.configuration = config
        
        btn.imageView?.contentMode = .scaleAspectFit
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 타이틀, 설명 그룹
    private lazy var grpLabel = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .leading
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setStackView(){
        grpLabel.addArrangedSubview(lblTitle)
        grpLabel.addArrangedSubview(lblDescription)
    }
    
    private func setUI() {
        self.addSubview(imgView)
        self.addSubview(grpLabel)
        self.addSubview(btnSaved)
        self.addSubview(lblPrice)
        
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(72)
            make.leading.top.equalToSuperview().offset(13)
        }
        
        grpLabel.snp.makeConstraints { make in
            make.width.equalTo(153)
//            make.height.equalTo(54)
            make.leading.equalTo(imgView.snp.trailing).offset(13)
            make.top.equalToSuperview().offset(13)
        }
        
        btnSaved.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(18)
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        lblPrice.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(imgView.snp.bottom)
        }
    }
    
    public func configure(model : SavedCellModel){
        self.imgView.image = UIImage(named: model.image)?.withRenderingMode(.alwaysOriginal)
        self.lblTitle.text = model.title
        self.lblDescription.text = model.description
        self.lblPrice.text = model.price.setWon() + "원"
    }

}
