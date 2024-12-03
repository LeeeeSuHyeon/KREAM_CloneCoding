//
//  SearchTableViewCell.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static let id = "SearchTableViewCell"
    
    private let lblTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        lblTitle.text = nil
    }
    
    private func setUI(){
        self.addSubview(lblTitle)
        
        lblTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    public func config(title : String) {
        lblTitle.text = title
    }
}
