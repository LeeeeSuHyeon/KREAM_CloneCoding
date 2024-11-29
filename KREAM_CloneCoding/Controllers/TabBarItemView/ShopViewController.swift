//
//  ShopViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class ShopViewController: UIViewController {
    private lazy var shopView : ShopView = {
        let view = ShopView()
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = shopView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
