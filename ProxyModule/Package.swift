// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProxyModule",
    platforms: [
      .iOS(.v16)
    ],
    products: [
        .library(
            name: "ProxyModule",
            targets: ["ProxyModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/uber/RIBs.git", branch: "main"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", branch: "main"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "ProxyModule",
        dependencies: [
            .product(name: "SnapKit", package: "SnapKit"),
            .product(name: "RIBs", package: "RIBs"),
            .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
            .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
            .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
        ])

    ]
)
