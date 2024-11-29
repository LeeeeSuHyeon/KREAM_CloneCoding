//
//  ViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/23/24.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: UIViewController {
    let userDefaultsModel = UserDefaultsModel()
    
    private lazy var loginView : LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = loginView
        setAction()
    }
    
    private func setAction() {
        loginView.btnLogin.addTarget(self, action: #selector(btnLoginDidTap), for: .touchUpInside)
        loginView.btnKakao.addTarget(self, action: #selector(btnKakaoLoginDidTap), for: .touchUpInside)
    }
    
    
    @objc
    private func btnLoginDidTap(){
        let mainVC = TabBarViewController()
        mainVC.modalPresentationStyle = .fullScreen
        
        // 로그인 정보 저장
        if let id = loginView.txtId.text, let pwd = loginView.txtPwd.text {
            userDefaultsModel.saveData(text: id, key: "id")
            userDefaultsModel.saveData(text: pwd, key: "pwd")
            print("id, pwd 저장")
        }
        print(userDefaultsModel.loadData(key: "id") ?? "id - no")
        print(userDefaultsModel.loadData(key: "pwd") ?? "pwd - no")
        
        present(mainVC, animated : true)
    }
    
    
    @objc private func btnKakaoLoginDidTap(){
        // 카카오톡 실행 가능 여부 확인 (카카오톡 설치가 안 되어 있을 때) else -> market으로 이동
//        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//        UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    // 카카오 로그인 실패 alert
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    self.saveUserInfo(token: oauthToken)
                    
                    let mainVC = TabBarViewController()
                    mainVC.modalPresentationStyle = .fullScreen
                    self.present(mainVC, animated : true)
                }
            }
//        } else {
//            print("KakaoTalk Login Not Available")
//        }
    }
    
    private func saveUserInfo(token : OAuthToken?){
        
        // 성공 시 동작 구현
        // 토큰 저장
        guard let accessToken = token?.accessToken else {
            print("oauthToken?.accessToken invalid")
            return
        }
        KeychainService.shared.save(account: "login", service: .loginToken, token: accessToken)
        print(KeychainService.shared.load(account: "login", service: .loginToken) ?? "loginToken 없음")
        
        UserApi.shared.me { user, error in
            if let error = error {
                print(error)
                return
            } else {
                let nickname = user?.kakaoAccount?.profile?.nickname ?? ""
                KeychainService.shared.save(account: "login", service: .nickname, token: nickname)
                print("saveUserInfo: \(String(describing: KeychainService.shared.load(account: "login", service: .nickname)))")
            }
        }
    }
}

