//
//  LoginView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/23/24.
//

import UIKit
import Then

class LoginView: UIView {

    // 상단 로고
    private lazy var imgViewLogo = UIImageView().then { view in
        view.image = UIImage(named: "kream_logo")
        view.contentMode = .scaleAspectFit
    }
    
    // 아아디 라벨
    private lazy var lblId = UILabel().then{ lbl in
        lbl.text = "이메일 주소"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .left
    }
    
    // 아이디 텍스트 필드
    public lazy var txtId = UITextField().then{ text in
        text.backgroundColor = .white
        text.font = .systemFont(ofSize: 12)
        text.placeholder = "예) kream@kream.co.kr"
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0)) // placeholder 공백
        text.leftView = leftView
        text.leftViewMode = .always
        
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 15
        text.layer.borderColor = UIColor(hex: "#A2A2A2")?.cgColor
        text.layer.borderWidth = 1
    }
    
    // 패스워드 라벨
    private lazy var lblPwd = UILabel().then { lbl in
        lbl.text = "비밀번호"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .left
    }
    
    // 패스워드 텍스트 필드
    public lazy var txtPwd = UITextField().then { text in
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0)) // placeholder 공백
        text.backgroundColor = .white
        text.font = .systemFont(ofSize: 12)
        text.placeholder = "비밀번호를 입력해주세요"
        text.isSecureTextEntry = true
        
        text.leftView = leftView
        text.leftViewMode = .always
        
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 15
        text.layer.borderColor = UIColor(hex: "#A2A2A2")?.cgColor
        text.layer.borderWidth = 1
    }
    
    // 로그인 버튼
    public lazy var btnLogin = UIButton().then{ btn in
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.tintColor = .white
        btn.backgroundColor = UIColor(hex: "#D9D9D9") ?? .systemGray
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 8
    }
    
    // 카카오 로그인 버튼
    public lazy var btnKakao = OtherLoginButton(title: "카카오로 로그인", imageName: "kakao_logo")
    
    // 애플 로그인 버튼
    public lazy var btnApple = OtherLoginButton(title: "Apple로 로그인", imageName: "apple_logo")

    
    // 아이디 스택 뷰
    private lazy var grpId = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
    }
    
    // 비밀번호 스택 뷰
    private lazy var grpPwd = UIStackView().then { view in
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 8
    }
    
    // 로그인 스택 뷰
    private lazy var grpLogin = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 17
        view.alignment = .center
    }
    
    // 기타 로그인 스택 뷰
    private lazy var grpOtherLogin = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 22
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setSubView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubView() {
        [
            imgViewLogo,
            grpLogin,
            grpOtherLogin
        ].forEach { self.addSubview($0) }
        
        [
            grpId,
            grpPwd,
            btnLogin
        ].forEach{grpLogin.addArrangedSubview($0)}
        
        [
            lblId,
            txtId
        ].forEach{grpId.addArrangedSubview($0)}
        
        [
            lblPwd,
            txtPwd
        ].forEach{grpPwd.addArrangedSubview($0)}
        
        [
            btnKakao,
            btnApple
        ].forEach{grpOtherLogin.addArrangedSubview($0)}
    }
    private func setUI(){
        // 로고 이미지 뷰
        imgViewLogo.snp.makeConstraints { make in
            make.width.equalTo(287)
            make.height.equalTo(75)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(126)
        }
        
        // 아이디 텍스트 필드
        txtId.snp.makeConstraints { make in
            make.width.equalTo(303)
            make.height.equalTo(34)
        }
        
        // 비밀번호 텍스트 필드
        txtPwd.snp.makeConstraints { make in
            make.width.equalTo(303)
            make.height.equalTo(34)
        }
        
        // 로그인 버튼
        btnLogin.snp.makeConstraints { make in
            make.width.equalTo(303)
            make.height.equalTo(38)
        }
        
        // 로그인 스택 뷰
        grpLogin.snp.makeConstraints { make in
            make.top.equalTo(imgViewLogo.snp.bottom).offset(87)
            make.centerX.equalToSuperview()
        }
        
        // 카카오 버튼
        btnKakao.snp.makeConstraints { make in
            make.width.equalTo(298)
            make.height.equalTo(40)
        }
        
        // 애플 버튼
        btnApple.snp.makeConstraints { make in
            make.width.equalTo(298)
            make.height.equalTo(40)
        }
        
        // 기타 로그인 뷰
        grpOtherLogin.snp.makeConstraints { make in
            make.top.equalTo(grpLogin.snp.bottom).offset(87)
            make.centerX.equalToSuperview()
        }
    }
}
