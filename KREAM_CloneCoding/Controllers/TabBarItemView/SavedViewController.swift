//
//  SavedViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 9/29/24.
//

import UIKit

class SavedViewController: UIViewController {
    let datas = dummySavedCellData.datas
    lazy var savedViewData = SavedViewData(count: datas.count)
    
    private lazy var savedView : SavedView = {
        let view = SavedView()
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        savedView.config(viewData: savedViewData)
        self.view = savedView
    }
    
    private func setDataSource(){
        savedView.tableView.dataSource = self
        savedView.tableView.delegate = self
    }

}

extension SavedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        cell.configure(model: datas[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106.0
    }
    
}
