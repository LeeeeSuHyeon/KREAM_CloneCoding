//
//  APIClient.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/8/24.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session : Session
    
    init() {
        if let key = Bundle.main.infoDictionary?["KakaoAPIKey"] as? String{
            print("KakaoAPIKey : \(key)")
            let interceptor = AuthorizationInterceptor(kakaoKey: key)
            session = Session(interceptor : interceptor)
        } else {
            session = Session()
        }
    }
    
    public func request<T : Codable>(url : URLConvertible, method : HTTPMethod, parameters : Parameters? = nil, completion : @escaping (Result<T, Error>) -> Void){
        session.request(url, method: method, parameters: parameters)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data) :
                    completion(.success(data))
                case .failure(let error) :
                    print(error)
                    completion(.failure(error))
                }
            }
    }
}
