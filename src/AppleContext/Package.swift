// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppleContext",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppleContext",
            targets: ["AppleContext"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "XCTest_Gherkin", url: "https://github.com/net-a-porter-mobile/XCTest-Gherkin", from: "0.19.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppleContext",
            dependencies: []),
        .testTarget(
            name: "AppleContextTests",
            dependencies: ["AppleContext", "XCTest_Gherkin"],
            resources: [.process("TaskTests/Features")]
        )
    ]
)
