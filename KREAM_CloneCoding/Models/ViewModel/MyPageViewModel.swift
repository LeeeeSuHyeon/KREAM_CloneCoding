//
//  MyPageViewModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/3/24.
//

import Foundation
import UIKit

struct MyPageViewModel {
    let image : UIImage
    let nickname : String
    let follower : String
    let following : String
    
    init(image: UIImage, nickname: String, follower: Int, following: Int) {
        self.image = image
        self.nickname = nickname
        self.follower = "\(follower)"
        self.following = "\(following)"
    }
}
