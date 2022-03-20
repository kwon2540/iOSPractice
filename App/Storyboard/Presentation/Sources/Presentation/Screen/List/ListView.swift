//
//  ListView.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit

final class ListView: UIView {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        loadOwnedXib()
        setup()
        
        viewModel.crash()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView {
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListView: UITableViewDelegate {
    
}


extension ListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
