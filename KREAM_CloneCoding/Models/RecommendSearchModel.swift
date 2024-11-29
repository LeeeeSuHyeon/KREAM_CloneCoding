//
//  RecommendSearchModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import Foundation

struct RecommendSearchModel {
    let title : String
}


extension RecommendSearchModel {
    static func dummy() -> [RecommendSearchModel] {
        [
            RecommendSearchModel(title: "채원 슈프림 후리스"),
            RecommendSearchModel(title: "나이키V2K런"),
            RecommendSearchModel(title: "뉴발란드996"),
            RecommendSearchModel(title: "신상 나이키 콜라보"),
            RecommendSearchModel(title: "허그 FW 패딩"),
            RecommendSearchModel(title: "벨루어 눕시"),
            RecommendSearchModel(title: "엄청나게 긴 문자열 엄청나게 긴 문자열 엄청나게 긴 문자열"),
        ]
    }
}
