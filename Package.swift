// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Extensions",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Extensions",
            targets: ["Extensions"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Extensions",
            dependencies: []
        ),
        .testTarget(
            name: "ExtensionsTests",
            dependencies: ["Extensions"]
        )
    ]
)
