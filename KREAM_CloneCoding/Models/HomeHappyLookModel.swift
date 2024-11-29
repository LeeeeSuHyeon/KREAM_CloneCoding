//
//  HappyLookModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/20/24.
//

import Foundation
import UIKit

struct HomeHappyLookModel {
    var image : String
    var id : String
}


extension HomeHappyLookModel {
    
    static func dummy() -> [HomeHappyLookModel] {
        return [
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2023/10/20231013_carina_01-13.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2023/10/20231013_carina_01-8.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2023/10/20231013_carina_01-5.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://cdn2.smentertainment.com/wp-content/uploads/2024/09/%EC%97%90%EC%8A%A4%ED%8C%8C-%EC%B9%B4%EB%A6%AC%EB%82%98-%ED%94%84%EB%9D%BC%EB%8B%A4-%ED%8C%A8%EC%85%98%EC%87%BC-%EC%B0%B8%EC%84%9D-%EC%9D%B4%EB%AF%B8%EC%A7%80.jpeg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://cdn.newsculture.press/news/photo/202311/536776_670149_2545.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2021/09/20210913_orange_01-4.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2021/09/20210913_orange_01-2.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2021/09/20210913_orange_01-1.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2021/09/20210913_orange_01-5.jpg", id: "@qwqeqwe"),
            HomeHappyLookModel(image: "https://fashionseoul.com/wp-content/uploads/2021/09/20210913_orange_01-3.jpg", id: "@qwqeqwe"),
        ]
    }
}
