//
//  PurchaseCollectionViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/2/24.
//

import UIKit

class PurchaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "PurchaseCollectionViewCell"
    
    public lazy var grpView = UIView().then { view in
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#F2F2F2")?.cgColor
    }
    
    public lazy var lblSize = UILabel().then { lbl in
//        lbl.text = "size"
        lbl.font = .systemFont(ofSize: 14)
    }
    
    public lazy var lblPrice = UILabel().then { lbl in
//        lbl.text = "10,000"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = UIColor(hex: "#D95A5D")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    private func setUI(){
        addSubview(grpView)
        grpView.addSubview(lblSize)
        grpView.addSubview(lblPrice)
        
        grpView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        lblSize.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
        }
        
        lblPrice.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lblSize.snp.bottom)
        }
    }
    
    func config(size : String, price : Int) {
        self.lblSize.text = size
        self.lblPrice.text = price.setWon()
    }
    
    func setBoldCell() {
        boldLabel(label: lblSize, size: 14, isBold: true)
        boldLabel(label: lblPrice, size: 12, isBold: true)
        borderView(isBold: true)
    }
    
    func setBasicCell() {
        boldLabel(label: lblSize, size: 14, isBold: false)
        boldLabel(label: lblPrice, size: 12, isBold: false)
        borderView(isBold: false)
    }
    
    private func boldLabel(label : UILabel, size : CGFloat, isBold : Bool){
        
        if isBold {
            // 기존 속성을 유지하고 font만 변경
            if let attributedText = label.attributedText {
                let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
                mutableAttributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: size, weight: .bold), range: NSRange(location: 0, length: mutableAttributedText.length))
                label.attributedText = mutableAttributedText
            }
        } else {
            // 기존 속성을 유지하고 font만 변경
            if let attributedText = label.attributedText {
                let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
                mutableAttributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: size), range: NSRange(location: 0, length: mutableAttributedText.length))
                label.attributedText = mutableAttributedText
            }
        }

    }
    private func borderView(isBold : Bool) {
        if isBold {
            grpView.layer.borderColor = UIColor.black.cgColor
        } else {
            grpView.layer.borderColor = UIColor(hex: "#F2F2F2")?.cgColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
