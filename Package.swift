// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "error-presentation",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v11),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "ErrorPresentation",
            targets: ["ErrorPresentation"]),
    ],
    targets: [
        .target(
            name: "ErrorPresentation"),

    ]
)
