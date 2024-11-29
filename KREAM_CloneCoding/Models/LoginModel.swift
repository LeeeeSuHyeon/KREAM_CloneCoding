//
//  LoginModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/23/24.
//

import Foundation

struct LoginModel {
    var id : String
    var pwd : String
    
    mutating func setData(id : String, pwd : String) {
        self.id = id
        self.pwd = pwd
    }
}
