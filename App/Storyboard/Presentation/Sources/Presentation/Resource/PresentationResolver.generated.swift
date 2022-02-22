//
//  Resolver.swift
//  Generated by dikitgen.
//

import DIKit
import Foundation

extension PresentationResolver {

    func resolvePresentation() -> Presentation {
        let presentationModel = resolvePresentationModel()
        return Presentation(dependency: .init(model: presentationModel))
    }

    func resolvePresentationModel() -> PresentationModel {
        return providePresentationModel()
    }

}
