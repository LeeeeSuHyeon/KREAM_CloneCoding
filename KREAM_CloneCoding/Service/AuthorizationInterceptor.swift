//
//  AuthorizationInterceptor.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/8/24.
//

import UIKit
import Alamofire

class AuthorizationInterceptor : RequestInterceptor {
    private let kakaoKey : String
    
    init(kakaoKey: String) {
        self.kakaoKey = kakaoKey
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.setValue("KakaoAK \(kakaoKey)", forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
