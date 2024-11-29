//
//  SavedView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class SavedView: UIView {

    private lazy var lblTitle = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.text = "Saved"
    }
    
    public lazy var lblCount = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 14)
    }
    
    public lazy var tableView = UITableView().then { view in
        view.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        view.separatorStyle = .singleLine   // 구분선
        view.separatorColor = .gray
        view.tintColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
    }
    
    private func setUI(){
        self.addSubview(lblTitle)
        self.addSubview(lblCount)
        self.addSubview(tableView)
        
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(61)
        }
        
        lblCount.snp.makeConstraints { make in
            make.leading.equalTo(lblTitle.snp.leading)
            make.top.equalTo(lblTitle.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(lblCount.snp.bottom).offset(12)
        }
    }
    
    public func config(viewModel : SavedViewModel) {
        lblCount.text = "전체 \(viewModel.count)개"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

