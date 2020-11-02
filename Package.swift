// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "IGStoryKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "IGStoryKit",
            targets: ["IGStoryKit"]),
    ],
    targets: [
        .target(
            name: "IGStoryKit",
            dependencies: []),
        .testTarget(
            name: "IGStoryKitTests",
            dependencies: ["IGStoryKit"]),
    ]
)
