//
//  DetailViewModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/3/24.
//

import Foundation
import UIKit

struct DetailViewData {
    let image : String
    let title : String
    let description : String
    let price : String
    let isSaved : Bool
    let savedCount : String
    let purchasePrice : String
    let sellPrice : String
    
    init(item : HomeJustDropModel) {
        self.image = item.image
        self.title = item.title
        self.description = item.subTitle
        self.price = "\(item.price.setWon())원"
        self.isSaved = item.isSaved
        self.savedCount = item.savedCount.setWon()
        self.purchasePrice = item.immediatelyPurchasePrice.setWon()
        self.sellPrice = item.immediatelySellPrice.setWon()
    }
}
