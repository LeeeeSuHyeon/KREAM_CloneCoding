//
//  KeychainService.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/8/24.
//

import Foundation
import Security

public enum Service : String{
    case loginToken = "loginToken"
    case nickname = "nickname"
}


class KeychainService {
    static let shared = KeychainService()
    
    
    
    @discardableResult
    func save(account: String, service: Service, token: String) -> OSStatus {
        let tokenData = token.data(using: .utf8)!  // 저장할 데이터: 문자열을 Data로 변환
        
        // 저장할 데이터와 속성을 포함한 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 토큰 저장
            kSecAttrAccount as String: account,            // 계정 이름
            kSecAttrService as String: service.rawValue,    // 서비스 이름
            kSecValueData as String: tokenData           // 실제 데이터
        ]
        
        // 기존 항목이(같은 키) 있으면 삭제
        SecItemDelete(query as CFDictionary)
        
        // 새로운 데이터 저장
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    @discardableResult
    func load(account: String, service: Service) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service.rawValue,
            kSecReturnData as String: true,               // 데이터 반환 요청
            kSecMatchLimit as String: kSecMatchLimitOne   // 하나의 결과만 반환
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else { return nil }
        
        if let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        }
        
        return nil
    }
    
    // Keychain에서 데이터를 삭제하는 함수
    @discardableResult
    func delete(account: String, service: Service) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 비밀번호 클래스 사용
            kSecAttrAccount as String: account,           // 계정 이름
            kSecAttrService as String: service.rawValue              // 서비스 이름
        ]
        
        // 해당하는 Keychain Item 삭제
        return SecItemDelete(query as CFDictionary)
    }
}

