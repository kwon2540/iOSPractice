// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "Domain"),
        .package(url: "https://github.com/uber/needle.git", .exact("0.18.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Data",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
                .product(name: "NeedleFoundation", package: "needle"),
            ]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
