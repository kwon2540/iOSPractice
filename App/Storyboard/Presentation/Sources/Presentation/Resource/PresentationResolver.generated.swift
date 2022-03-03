//
//  Resolver.swift
//  Generated by dikitgen.
//

import DIKit
import Foundation
import UIKit

extension PresentationResolver {

    func resolveDetailViewController() -> DetailViewController {
        let detailViewModel = resolveDetailViewModel()
        return DetailViewController(dependency: .init(viewModel: detailViewModel))
    }

    func resolveDetailViewModel() -> DetailViewModel {
        return DetailViewModel(dependency: .init())
    }

    func resolveListViewController() -> ListViewController {
        let listViewModel = resolveListViewModel()
        return ListViewController(dependency: .init(viewModel: listViewModel))
    }

    func resolveListViewModel() -> ListViewModel {
        return ListViewModel(dependency: .init())
    }

}

