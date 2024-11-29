//
//  MyPageView.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class MyPageView: UIView {

    // 상단 컴포넌트 그룹
    private lazy var grpTopView : UIStackView = {
        let view = UIStackView(arrangedSubviews: [grpTopBtn, grpProfile, grpProfileBtn])
        view.axis = .vertical
        view.spacing = 26
        view.alignment = .leading
        view.distribution = .equalCentering
        return view
    }()
    
    // 상단 버튼 모음 (gearshape, camera)
    private lazy var grpTopBtn : UIView = {
        let view = UIView()
    
        view.addSubview(btnSetting)
        view.addSubview(btnCamera)
        view.tintColor = .black

        return view
    }()
    
    // 설정 버튼
    private lazy var btnSetting : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)

        return button
    }()
    
    // 카메라 버튼
    private lazy var btnCamera : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)

        return button
    }()
    
    // 프로필 그룹
    private lazy var grpProfile : UIStackView = {
        let view = UIStackView(arrangedSubviews: [profileImgView, grpProfileText])
        view.axis = .horizontal
        view.spacing = 16
        view.alignment = .center
        return view
    }()
    
    // 프로필 이미지
    public lazy var profileImgView : UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: profileImage ?? "")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = view.frame.width / 2
        view.clipsToBounds = true   // 이미지의 크기를 이미지 뷰의 크기에 맞출 것인지
        view.layer.borderColor = UIColor.clear.cgColor // 테두리 제거
        
        return view
    }()
    
    // 프로필 텍스트 그룹
    private lazy var grpProfileText : UIStackView = {
        let view = UIStackView(arrangedSubviews: [lblProfileName, grpProfileFollow])
        view.axis = .vertical
        view.spacing = 6
        return view
    }()
    
    // 프로필 이름
    private lazy var lblProfileName : UILabel = {
        let label = UILabel()
        label.text = "Soo_iOS"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    // 프로필 팔로워, 팔로잉 프레임
    private lazy var grpProfileFollow : UIStackView = {
        let view = UIStackView(arrangedSubviews: [lblFollower, lblFollowing])
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    // 팔로워
    private lazy var lblFollower : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    // 팔로잉
    private lazy var lblFollowing : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    // 프로필 버튼 모음
    private lazy var grpProfileBtn : UIStackView = {
        let view = UIStackView(arrangedSubviews: [btnProfileManage, btnProfileShare])
        view.axis = .horizontal
        view.spacing = 14
        return view
    }()
    
    // 프로필 설정 버튼
    public lazy var btnProfileManage : UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 0.8
        btn.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        btn.setTitle("프로필 관리", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 9)

        return btn
    }()
    
    // 프로필 공유 버튼
    public lazy var btnProfileShare : UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 0.8
        btn.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        btn.setTitle("프로필 공유", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 9)

        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    
    private func setUI(){
        self.addSubview(grpTopView)
        
        // 상단 컴포넌트 그룹
        grpTopView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(75)
        }
        
        // 상단 설정 버튼
        btnSetting.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.leading.equalToSuperview()
        }
        
        // 카메라 버튼
        btnCamera.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.trailing.equalToSuperview()
        }
        
        // 상단 버튼 그룹
        grpTopBtn.snp.makeConstraints { make in
            make.width.equalTo(328)
        }
        
        // 프로필 프레임
        grpProfile.snp.makeConstraints { make in
//            make.leading.equalToSuperview()
//            make.width.equalTo(221)
        }
        
        // 프로필 이미지
        profileImgView.snp.makeConstraints { make in
            make.width.height.equalTo(90)
        }
        
        // 프로필 텍스트 프레임
        grpProfileText.snp.makeConstraints { make in
//            make.top.bottom.equalTo(16)
//            make.width.equalTo(115)
        }
        
        // 프로필 이름
//        lblProfileName.snp.makeConstraints { make in
//            make.width.equalTo(115)
//        }
        
        // 팔로우, 팔로잉 그룹
        grpProfileFollow.snp.makeConstraints { make in
//            make.width.equalTo(115)
        }
        
        // 프로필 버튼 그룹
        grpProfileBtn.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // 프로필 관리 버튼
        btnProfileManage.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        // 프로필 공유 버튼
        btnProfileShare.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func config(viewData : MyPageViewData){
        profileImgView.image = viewData.image
        lblProfileName.text = viewData.nickname
        
         let followingText = "팔로잉 \(viewData.follower)"
         let followingAttributedText = NSMutableAttributedString(string: followingText)
         followingAttributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: (followingText as NSString).range(of: viewData.follower))
         lblFollower.attributedText = followingAttributedText
         
         
         let followerText = "팔로워 \(viewData.follower)"
         let followerAttributedText = NSMutableAttributedString(string: followerText)
         followerAttributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: (followerText as NSString).range(of: viewData.follower))
         lblFollowing.attributedText = followerAttributedText
    }

}
