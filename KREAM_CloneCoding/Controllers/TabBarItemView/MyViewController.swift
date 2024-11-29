//
//  ProfileViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class MyViewController: UIViewController {
    let profileImage = "profile_image"
    private lazy var viewData : MyPageViewData = {
        let nickname = KeychainService.shared.load(account: "login", service: .nickname) ?? "닉네임 없음"
        print("MyViewController - nickname : \(nickname)")
        let viewData = MyPageViewData(image: UIImage(named: profileImage) ?? .appleLogo, nickname: nickname, follower: 909, following: 909)
        return viewData
    }()
    
    private lazy var myPageView : MyPageView = {
        let view = MyPageView()
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setAction()
        myPageView.config(viewData: viewData)
        self.view = myPageView
    }
    
    private func setAction(){
        myPageView.btnProfileManage.addTarget(self, action: #selector(btnProfileManagementDidTap), for: .touchUpInside)
        myPageView.btnProfileShare.addTarget(self, action: #selector(btnProfileShareDidTap), for: .touchUpInside)
    }
    
    @objc func btnProfileManagementDidTap(){
        let managementVC = ProfileManagementViewController(profileImage: profileImage)

        navigationController?.pushViewController(managementVC, animated: true)
    }
    
    @objc func btnProfileShareDidTap(){
        print("myPageView.btnProfileShare - didTap")
    }
}
