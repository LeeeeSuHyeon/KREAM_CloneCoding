//
//  SearchDetailView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit

class SearchDetailView : UIView {
    
    private let grpTopView = UIView()
    
    public let btnArror = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrow.backward")
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        btn.configuration = config
        btn.tintColor = .black
    }
    
    public let txtSearch = SearchTextField()
    public let btnCancel = CancelButton()
    
    public let tableView = UITableView().then { view in
        view.separatorStyle = .none
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.id)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setSubView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubView() {
        [
            btnArror,
            txtSearch,
            btnCancel
        ].forEach{grpTopView.addSubview($0)}
        
        [
            grpTopView,
            tableView
        ].forEach{self.addSubview($0)}
    }
    
    private func setUI() {
        grpTopView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(57)
        }
        
        btnArror.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(14)
        }
        
        txtSearch.snp.makeConstraints { make in
            make.leading.equalTo(btnArror.snp.trailing).offset(15)
            make.top.equalToSuperview().inset(7)
            make.bottom.equalToSuperview().inset(11)
        }
        
        btnCancel.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(17)
            make.top.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(txtSearch.snp.trailing).offset(11).priority(.high)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(grpTopView.snp.bottom).offset(31)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    public func setBorder(){
        let color = UIColor(hex: "#DDDDDD") ?? .white
        grpTopView.addBottomBorder(color: color, width: 0.5)
    }
}
