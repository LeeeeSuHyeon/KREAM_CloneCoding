//
//  StyleViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class StyleViewController: UIViewController {

    private lazy var styleView : StyleView = {
        let view = StyleView()
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = styleView
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
