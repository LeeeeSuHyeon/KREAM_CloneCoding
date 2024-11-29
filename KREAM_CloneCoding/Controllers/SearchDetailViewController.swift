//
//  SearchDetailViewController.swift
//  KREAM_CloneCoding
//
//  Created by 이수현 on 11/15/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController {
    private let searchDetailView = SearchDetailView()
    private var items : SearchResponseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchDetailView
        setAction()
        setProtocol()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchDetailView.setBorder()
    }
    
    private func setProtocol(){
        self.searchDetailView.tableView.dataSource = self
    }
    
    private func setAction() {
        searchDetailView.btnArror.addTarget(self, action: #selector(didTapBtnArrow), for: .touchUpInside)
        searchDetailView.btnCancel.addTarget(self, action: #selector(didTapBtnCancel), for: .touchUpInside)
        searchDetailView.txtSearch.addTarget(self, action: #selector(completedSearch), for: .editingDidEndOnExit)
    }
    
    @objc func didTapBtnCancel() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func didTapBtnArrow(){
        self.dismiss(animated: true)
    }
    
    @objc func completedSearch(){
        guard let query = searchDetailView.txtSearch.text, query != "" else {
            print("검색어 없음")
            return
        }
        let allowedQuery = query.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) ?? query
        
        let provider = MoyaProvider<SearchTargetType>()
        provider.request(.search(query: allowedQuery)) { [weak self] response in
            switch response {
            case .success(let result):
                if 200..<400 ~= result.statusCode {
                    do {
                        let items = try result.map(SearchResponseModel.self)
                        self?.items = items
                        self?.searchDetailView.tableView.reloadData()
                    } catch  {
                        fatalError("Success 디코딩 에러 : \(error.localizedDescription)")
                    }
                } else {
                    do {
                        let message = try result.map(SearchFailureModel.self)
                        print(message)
                    } catch  {
                        fatalError("Failure 디코딩 에러 : \(error.localizedDescription)")
                    }
                }
            case .failure(let error) :
                fatalError("요청 에러 : \(error.localizedDescription)")
            }
        }
    }
}
extension SearchDetailViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.limit ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.id, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        cell.config(title: items?.products[indexPath.row].title ?? "")
        return cell
    }
}
