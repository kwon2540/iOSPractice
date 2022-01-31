
// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Tool",
    platforms: [.macOS(.v10_14)],
    dependencies: [
        .package(url: "https://github.com/yonaskolb/XcodeGen.git", .exact("2.25.0")),
    ],
    targets: [
        .target(
            name: "Dummy",
            dependencies: [
                .product(name: "xcodegen", package: "XcodeGen"),
            ],
            path: ""
        ),
    ]
)
