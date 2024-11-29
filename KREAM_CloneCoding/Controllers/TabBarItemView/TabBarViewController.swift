//
//  TabBarViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {

    private let homeVC = UINavigationController(rootViewController: HomeViewController())
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myVC = UINavigationController(rootViewController: MyViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        setTabBarItem() // tabBarItem 설정
    }
    
    // tabBarItem 설정
    private func setTabBarItem(){
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "tabBar_selected_home")?.withRenderingMode(.alwaysOriginal), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "tabBar_style")?.withRenderingMode(.alwaysOriginal), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "tabBar_shop")?.withRenderingMode(.alwaysOriginal), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "tabBar_saved")?.withRenderingMode(.alwaysOriginal), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "tabBar_my")?.withRenderingMode(.alwaysOriginal), tag: 4)
        
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        self.tabBar.isTranslucent = false   // 탭 바의 배경 불투명으로 설정
        self.tabBar.tintColor = .black

    }
    
    private func setTabBarImage(){
        homeVC.tabBarItem.image = UIImage(named: "tabBar_home")?.withRenderingMode(.alwaysOriginal)
        styleVC.tabBarItem.image = UIImage(named: "tabBar_style")?.withRenderingMode(.alwaysOriginal)
        shopVC.tabBarItem.image = UIImage(named: "tabBar_shop")?.withRenderingMode(.alwaysOriginal)
        savedVC.tabBarItem.image = UIImage(named: "tabBar_saved")?.withRenderingMode(.alwaysOriginal)
        myVC.tabBarItem.image = UIImage(named: "tabBar_my")?.withRenderingMode(.alwaysOriginal)
    }
}

extension TabBarViewController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        setTabBarImage()    // 이미지 초기화
        
        switch viewController {
        case homeVC :
            homeVC.tabBarItem.image = UIImage(named: "tabBar_selected_home")?.withRenderingMode(.alwaysOriginal)
            break
        case styleVC :
            break
        case shopVC :
            break
        case savedVC :
            savedVC.tabBarItem.image = UIImage(named: "tabBar_selected_saved")?.withRenderingMode(.alwaysOriginal)
        case myVC :
            myVC.tabBarItem.image = UIImage(named: "tabBar_selected_my")?.withRenderingMode(.alwaysOriginal)
        default:
            break
        }
    }
}
