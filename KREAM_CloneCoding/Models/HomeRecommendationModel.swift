//
//  HomeCVModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/11/24.
//

import Foundation
import UIKit

public struct HomeRecommendationModel : Hashable {
    var image : UIImage
    var title : String
}

extension HomeRecommendationModel {
    static func dummy() -> [HomeRecommendationModel] {
        return [
            HomeRecommendationModel(image:.drawKream, title: "크림드로우"),
            HomeRecommendationModel(image: .realTimeChart, title: "실시간 차트"),
            HomeRecommendationModel(image: .maleRecommend, title: "남성 추천"),
            HomeRecommendationModel(image: .femaleRecommend, title: "여성 추천"),
            HomeRecommendationModel(image: .diffRecommend, title: "색다른 추천"),
            HomeRecommendationModel(image: .underPrice, title: "정가 아래"),
            HomeRecommendationModel(image: .yunSe, title: "윤세 24AW"),
            HomeRecommendationModel(image: .bestThisYear, title: "올해의 베스트"),
            HomeRecommendationModel(image: .benefit, title: "10월 베네핏"),
            HomeRecommendationModel(image: .presentAcne, title: "아크네 선물"),
        ]
    }
}
