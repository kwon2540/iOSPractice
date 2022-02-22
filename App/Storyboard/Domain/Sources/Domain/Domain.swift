import DIKit

public struct DomainModel {
    let string: String
}

public struct Domain: Injectable {

    public struct Dependency {
        let model: DomainModel
    }
    
    public private(set) var text: String

    public init(dependency: Dependency) {
        self.text = dependency.model.string
    }
}
