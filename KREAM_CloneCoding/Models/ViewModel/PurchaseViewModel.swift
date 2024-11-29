//
//  PurchaseViewModel.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/3/24.
//

import Foundation
import UIKit

struct PurchaseViewModel {
    let image : String
    let title : String
    let desription : String
    let expressedDeliveryPrice : String
    let normalDeliveryPrice : String
    
    init(item : HomeJustDropModel) {
        self.image = item.image
        self.title = item.title
        self.desription = item.subTitle
        self.expressedDeliveryPrice = item.expressedDeliveryPrice.setWon()
        self.normalDeliveryPrice = item.normalDeliveryPrice.setWon()
    }
}
