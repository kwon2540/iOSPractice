import DIKit
import RxSwift


public struct PresentationModel {
    let string: String
}

public struct Presentation: Injectable {
    
    public struct Dependency {
        let model: PresentationModel
    }
    
    public private(set) var text: String

    public init(dependency: Dependency) {
        self.text = dependency.model.string
    }
}
