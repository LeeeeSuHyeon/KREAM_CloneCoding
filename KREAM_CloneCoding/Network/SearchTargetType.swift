//
//  SearchTargetType.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import Foundation
import Moya

enum SearchTargetType {
    case search(query : String)
}


extension SearchTargetType : TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://dummyjson.com") else {
            fatalError("URL이 유효하지 않습니다.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .search(_):
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search(_):
                return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let query):
            return .requestParameters(parameters: ["q" : query], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .search(_):
            return ["Content-Type" : "application/json"]
        }
    }
}
