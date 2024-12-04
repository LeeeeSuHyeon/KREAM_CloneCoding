//
//  SectionItem.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 12/4/24.
//

import Foundation

public enum Section : Hashable {
    case banner
    case recommendation
    case product(HeaderInfo)
    case userStory(HeaderInfo)
}

public enum Item : Hashable {
    case bannerItem(HomeAdModel)
    case recommendationItem(HomeRecommendationModel)
    case productItem(HomeJustDropModel)
    case userStoryItem(HomeHappyLookModel)
}
