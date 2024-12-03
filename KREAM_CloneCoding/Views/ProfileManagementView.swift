//
//  ProfileManagementView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/30/24.
//

import UIKit

class ProfileManagementView: UIView {
    
    // 이미지 뷰
    private lazy var profileImgView : UIImageView = {
        let imgView = UIImageView()
//        imgView.image = UIImage(named: profileImage ?? "")
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = imgView.frame.width / 2
        imgView.layer.borderColor = UIColor.clear.cgColor
        return imgView
    }()
    
    // 프로필 그룹
    private lazy var grpProfile : UIStackView = {
        let view = UIStackView(arrangedSubviews: [lblProfileInfo, grpUserEmail, grpUserPwd])
        view.axis = .vertical
        view.spacing = 23
        view.alignment = .leading
        view.distribution = .fillProportionally
        return view
    }()
    
    // 프로필 정보 라벨
    private lazy var lblProfileInfo : UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.tintColor = .black
        return label
    }()
    
    // 유저 이메일 그룹
    private lazy var grpUserEmail = ProfileInfoGroup(info: .email)

    // 유저 비밀번호 그룹
    private lazy var grpUserPwd = ProfileInfoGroup(info: .password)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.addSubview(profileImgView)
        self.addSubview(grpProfile)
        
        // 프로필 이미지 뷰
        profileImgView.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.top.equalToSuperview().offset(144)
            make.centerX.equalToSuperview()
        }
        
        // 프로필 그룹
        grpProfile.snp.makeConstraints { make in
            make.top.equalTo(profileImgView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    public func config(viewData : ProfileManagementViewData){
        grpUserEmail.txtUserInfo.text = viewData.id
        grpUserPwd.txtUserInfo.text = viewData.pwd
        profileImgView.image = viewData.image
    }
    
    public func changeInfo(flag : Bool, info : Info){
        let changedInfoView = info.rawValue == "id" ? self.grpUserEmail : self.grpUserPwd
        if flag {
            changedInfoView.txtUserInfo.text = ""
            changedInfoView.txtUserInfo.isUserInteractionEnabled = true
            changedInfoView.btnChangeInfo.setTitle("확인", for: .normal)
            
        }
        else {
            changedInfoView.txtUserInfo.isUserInteractionEnabled = false
            changedInfoView.btnChangeInfo.setTitle("변경", for: .normal)
        }
    }
}

public enum Info : String{
    case id = "id"
    case password = "password"
}
