//
//  ListView.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit
import Domain
import RxSwift

final class ListView: UIView {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: ListViewModel
    private let disposeBag = DisposeBag()
    
    private var repositories: [GitHubRepositoryModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
        }
    }
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        loadOwnedXib()
        
        setup()
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView {
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerXib(of: ListCell.self)
    }
}

extension ListView {
    
    private func bind() {
        // Input
        searchBar.rx.searchButtonClicked
            .withLatestFrom(searchBar.rx.text)
            .bind(to: viewModel.searchButtonClicked)
            .disposed(by: disposeBag)
        
        // Output
        viewModel.repositories
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] repositories in
                guard let self = self else { return }
                
                self.repositories = repositories
            })
            .disposed(by: disposeBag)
    }
}

extension ListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellViewModel = repositories[indexPath.row]
        viewModel.cellTapped.onNext((url: cellViewModel.htmlUrl, title: cellViewModel.name))
    }
}


extension ListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(of: ListCell.self, for: indexPath)
        cell.bind(with: cellViewModel(for: indexPath))
        return cell
    }
    
    private func cellViewModel(for indexPath: IndexPath) -> ListCellViewModelType {
        let repository = repositories[indexPath.row]
        return ListCellViewModel(repository: repository)
    }
}
