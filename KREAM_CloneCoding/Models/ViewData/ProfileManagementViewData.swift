//
//  ProfileManagementViewModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/3/24.
//

import Foundation
import UIKit

struct ProfileManagementViewData {
    let image : UIImage
    let id : String
    let pwd : String
    
    init(image: UIImage, id: String, pwd: String) {
        self.image = image
        self.id = id
        self.pwd = pwd
    }
}
