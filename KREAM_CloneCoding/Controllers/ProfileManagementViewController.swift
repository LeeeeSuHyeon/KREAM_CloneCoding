//
//  ProfileManagementViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/30/24.
//

import UIKit

class ProfileManagementViewController: UIViewController {
    var profileImage : String
    lazy var viewData : ProfileManagementViewData = ProfileManagementViewData(image: UIImage(named: profileImage) ?? .appleLogo, id: id, pwd: pwd)
    
    let userDefaluts = UserDefaultsModel()
    lazy var id = userDefaluts.loadData(key: "id") ?? ""
    lazy var pwd = userDefaluts.loadData(key: "pwd") ?? ""
    var idFlag = true
    var pwdFlag = true
    
    
    init(profileImage: String) {
        self.profileImage = profileImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private lazy var profileManagementView : ProfileManagementView = {
        let view = ProfileManagementView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManagementView
        profileManagementView.config(viewData: viewData)
        setNavigation()
        setAction()
    }
    
    private func setAction(){
        // id 변경 버튼 액션 추가
        profileManagementView.grpUserEmail.btnChangeInfo.addTarget(self, action: #selector(idChangeBtn), for: .touchUpInside)
        
        // pwd 변경 버튼 액션 추가
        profileManagementView.grpUserPwd.btnChangeInfo.addTarget(self, action: #selector(pwdChangeBtn), for: .touchUpInside)
    }
    
    private func setNavigation() {
        navigationItem.title = "프로필 관리"
        
        // dismiss 버튼
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(popAction))
        leftItem.tintColor = .black
        navigationItem.setLeftBarButton(leftItem, animated: true)
    }

    // 뒤로 가기 버튼
    @objc func popAction(){
        navigationController?.popViewController(animated: true)
    }
    
    // 아이디 변경 버튼 액션
    @objc func idChangeBtn(){
        if idFlag {
            profileManagementView.changeId(idFlag: idFlag)
            idFlag = false
        }
        else {
            userDefaluts.saveData(text: profileManagementView.grpUserEmail.txtUserInfo.text ?? "", key: "id")
            profileManagementView.changeId(idFlag: idFlag)
            idFlag = true
        }
    }
    
    // 비밀번호 변경 버튼 액션
    @objc func pwdChangeBtn() {
        if pwdFlag {
            profileManagementView.changePwd(pwdFlag: pwdFlag)
            pwdFlag = false
        }
        else {
            userDefaluts.saveData(text: profileManagementView.grpUserPwd.txtUserInfo.text ?? "", key: "pwd")
            profileManagementView.changePwd(pwdFlag: pwdFlag)
            pwdFlag = true
        }
    }
}
