//
//  ProfileInfoGroup.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/6/24.
//

import UIKit

class ProfileInfoGroup : UIStackView {
    let info : ProfileInfo
    
    let labelText : String
    let textFieldPlaceHolder : String
    
    init(info: ProfileInfo) {
        self.info = info
        switch info {
        case .email:
            labelText = "유저 이메일"
            textFieldPlaceHolder = "새로운 이메일을 입력해주세요!"
        case .password:
            labelText = "유저 비밀번호"
            textFieldPlaceHolder = "새로운 비밀번호를 입력해주세요!"
        }
        super.init(frame: .zero)
        self.setUI()
        
    }
    
    private func setUI(){
        
        addArrangedSubview(lblUserInfo)
        addArrangedSubview(grpTxtBtn)
        axis = .vertical
        spacing = 6
        
        
        // 유저 텍스트 필드
        txtUserInfo.snp.makeConstraints { make in
            make.width.equalTo(282)
            make.height.equalTo(32)
        }
        
        // 유저 변경 버튼
        btnChangeInfo.snp.makeConstraints { make in
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
    }

    // 유저 정보 라벨
    private lazy var lblUserInfo : UILabel = {
        let label = UILabel()
        label.text = labelText
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    // 유저 텍스트 필드, 버튼 그룹
    private lazy var grpTxtBtn : UIStackView = {
        let view = UIStackView(arrangedSubviews: [txtUserInfo, btnChangeInfo])
        view.axis = .horizontal
        view.spacing = 9
        
        return view
    }()
    
    // 유저 이메일 텍스트 필드
    lazy var txtUserInfo : UITextField = {
        let textField = UITextField()
        textField.placeholder = textFieldPlaceHolder
        textField.font = .systemFont(ofSize: 14, weight: .semibold)
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        textField.isUserInteractionEnabled = false
        
        if info == .password {
            textField.isSecureTextEntry = true 
        }
        // 이렇게 제약조건을 여기다가 둬도 되는건가
        let emptyView = UIView()
        emptyView.snp.makeConstraints { make in
            make.width.equalTo(11)
        }
        
        textField.leftView = emptyView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    // 유저 변경 버튼
    lazy var btnChangeInfo : UIButton = {
        let btn = UIButton()
        btn.setTitle("변경", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        
        return btn
    }()
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


public enum ProfileInfo {
    case email
    case password
}
