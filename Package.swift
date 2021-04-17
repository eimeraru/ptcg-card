// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PTCGCard",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PTCGCard",
            targets: ["PTCGCard"]),
    ],
    dependencies: [
        .package(name: "PTCGEnergy", url: "https://github.com/evdwarf/ptcg-energy.git", from: "0.0.2"),
    ],
    targets: [
        .target(
            name: "PTCGCard",
            dependencies: ["PTCGEnergy"]),
        .testTarget(
            name: "PTCGCardTests",
            dependencies: ["PTCGCard"]),
    ]
)
