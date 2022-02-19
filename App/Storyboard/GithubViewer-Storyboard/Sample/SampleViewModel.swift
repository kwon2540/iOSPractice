//
//  SampleViewModel.swift
//  GithubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/02/19.
//

import Foundation
import DIKit

final class SampleViewModel: Injectable {
    struct Dependency {
        let model: SampleModel
    }

    let model: SampleModel

    init(dependency: Dependency) {
        self.model = dependency.model
    }
}
