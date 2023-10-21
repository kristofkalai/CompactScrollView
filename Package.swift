// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CompactScrollView",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CompactScrollView",
            targets: ["CompactScrollView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/stateman92/SizePreferenceKey.git", exact: .init(0, 0, 4))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CompactScrollView",
            dependencies: [
                .product(name: "SizePreferenceKey", package: "SizePreferenceKey")
            ],
            path: "Sources"),
        .testTarget(
            name: "CompactScrollViewTests",
            dependencies: ["CompactScrollView"]),
    ]
)
