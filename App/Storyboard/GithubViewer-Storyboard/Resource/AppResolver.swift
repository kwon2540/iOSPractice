//
//  AppResolver.swift
//  GithubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/02/19.
//

import Foundation
import DIKit

protocol AppResolver: Resolver {
    func provideSampleModel() -> SampleModel
}

final class AppResolverImpl: AppResolver {
    func provideSampleModel() -> SampleModel {
        return SampleModel(string: "Hello World!")
    }
}

