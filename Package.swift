// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RP2040MMIO",
    platforms: [.macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RP2040MMIO",
            targets: ["RP2040MMIO"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-mmio.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "RP2040Playground",
            dependencies: [
                "MMIOExtensions",
                "RP2040MMIO",
                .product(name: "MMIO", package: "swift-mmio"),
            ]),
        .target(
            name: "MMIOExtensions",
            dependencies: [
                .product(name: "MMIO", package: "swift-mmio"),
            ]),
        .target(
            name: "RP2040MMIO",
            dependencies: [
                "MMIOExtensions",
                .product(name: "MMIO", package: "swift-mmio"),
            ]),
    ]
)
