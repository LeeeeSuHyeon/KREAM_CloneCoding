//
//  File.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/7/24.
//

import Foundation

class UserDefaultsModel {
    private let userDefaluts = UserDefaults.standard
    
    public func saveData(text : String, key : String) {
        userDefaluts.set(text, forKey: key)
    }
    
    public func loadData(key : String) -> String? {
        return userDefaluts.string(forKey: key)
    }
}
