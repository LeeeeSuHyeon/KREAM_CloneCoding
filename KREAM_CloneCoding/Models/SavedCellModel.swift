//
//  SavedCellModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/7/24.
//

import Foundation

struct SavedCellModel {
    var image : String
    var title : String
    var description : String
    var price : Int
}

final class dummySavedCellData {
    static let datas = [
        SavedCellModel(image: "adidas-bape-shoes", title: "Adidas", description: "Adidas x BAPE superstar 80s Core Black Off While", price: 329000),
        SavedCellModel(image: "deus-jacket", title: "Deus Ex Machina", description: "Deus Ex Machina Address Workwear Jacket Black", price: 244000),
        SavedCellModel(image: "half-headband", title: "손오공이 잃어버린 머리띠 반쪽", description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: 942192000),
        SavedCellModel(image: "gold-ring", title: "골드 반지", description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: 942192000),
        SavedCellModel(image: "white-boots", title: "하얀 신발", description: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지지않음", price: 90000),
        SavedCellModel(image: "diamond-ring", title: "에베레스트 다이아 반지", description: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", price: 1292999000),
        SavedCellModel(image: "adidas-shoes", title: "아디다스다 신발", description: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: 120000),
        SavedCellModel(image: "emperor-pajamas", title: "황제 잠옷", description: "어느 나라의 황제가 입었다던 잠옷 \n크리스마스 트리같이 보이는 디자인!", price: 120000000),
        SavedCellModel(image: "guitar", title: "고장난 기타", description: "블라블라블라블라\n블라블라블라블라블라", price: 150000),
        SavedCellModel(image: "white-beverage", title: "하얀 음료", description: "결이 음료를 마시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔겠.....", price: 12000),
    ]
}
