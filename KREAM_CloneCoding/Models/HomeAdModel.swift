//
//  HomeAdModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 12/4/24.
//

import Foundation

public struct HomeAdModel : Hashable{
    let imageURL : String
}

extension HomeAdModel {
    static func dummy() -> [HomeAdModel] {
        return [
            HomeAdModel(imageURL: "https://cdn.mc-plus.net/news/photo/201511/1966_7556_259.jpg"),
            HomeAdModel(imageURL: "https://file.mk.co.kr/meet/neds/2019/12/image_readtop_2019_1053139_15764823714016017.jpg"),
            HomeAdModel(imageURL: "https://cdn.news2day.co.kr/data2/content/image/2012/04/04/20120404012598.jpg"),
            HomeAdModel(imageURL: "https://cdn.mc-plus.net/news/photo/201512/2067_7998_3612.png"),
            HomeAdModel(imageURL: "https://cdn.mc-plus.net/news/photo/202106/10843_31615_4946.jpg")
        ]
    }
}
