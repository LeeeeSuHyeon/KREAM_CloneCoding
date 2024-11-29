//
//  OtherLoginButton.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/6/24.
//

import UIKit

class OtherLoginButton : UIButton {
    let title : String
    let imageName : String
    var config : UIButton.Configuration

    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        self.config = UIButton.Configuration.plain()
        super.init(frame: .zero)
        setButton()
    }

    
    private func setButton(){
        config.image = UIImage(named: imageName)
        config.imagePlacement = .leading
        config.imagePadding = 69    // 이미지와 타이틀 사이의 패딩
        
        config.title = title
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 13, weight: .bold)

        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.background.cornerRadius = 8
        
        // 콘텐츠 인셋 설정
        config.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 17, bottom: 13, trailing: 102)
            
        self.configuration = config
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(hex: "#D3D3D3")?.cgColor
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
