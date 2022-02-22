//
//  PresentationResolver.swift
//  
//
//  Created by Maharjan Binish on 2022/02/22.
//

import Foundation
import DIKit

public protocol PresentationResolver: Resolver {
    func providePresentationModel() -> PresentationModel
}

public final class PresentationResolverImpl: PresentationResolver {
    
    public init() { }
    
    public func providePresentationModel() -> PresentationModel {
        return PresentationModel(string: "Hello Presentation!")
    }
}
