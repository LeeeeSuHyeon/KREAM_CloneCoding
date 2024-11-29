//
//  HomeCVModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/11/24.
//

import Foundation
import UIKit

struct HomeCVModel {
    var image : UIImage
    var title : String
}

extension HomeCVModel {
    static func dummy() -> [HomeCVModel] {
        return [
            HomeCVModel(image:.drawKream, title: "크림드로우"),
            HomeCVModel(image: .realTimeChart, title: "실시간 차트"),
            HomeCVModel(image: .maleRecommend, title: "남성 추천"),
            HomeCVModel(image: .femaleRecommend, title: "여성 추천"),
            HomeCVModel(image: .diffRecommend, title: "색다른 추천"),
            HomeCVModel(image: .underPrice, title: "정가 아래"),
            HomeCVModel(image: .yunSe, title: "윤세 24AW"),
            HomeCVModel(image: .bestThisYear, title: "올해의 베스트"),
            HomeCVModel(image: .benefit, title: "10월 베네핏"),
            HomeCVModel(image: .presentAcne, title: "아크네 선물"),
        ]
    }
}
