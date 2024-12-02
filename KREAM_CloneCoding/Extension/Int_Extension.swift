//
//  Int_Extension.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 10/19/24.
//

import Foundation
import UIKit

extension Int {
    func setWon() -> String {
        let numberFormatter : NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal // 10진법
        let won = numberFormatter.string(for: self) ?? ""
        return "\(won)"
    }
    
    func getWonString() -> String {
        let numberFormatter : NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal // 10진법
        let won = numberFormatter.string(for: self) ?? ""
        return "\(won)" + "원"
    }
}
