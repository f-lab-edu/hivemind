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
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", exact: "10.15.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0"),
        .package(url: "https://github.com/uber/RIBs.git", exact: "0.15.1"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "ProxyModule",
        dependencies: [
            .product(name: "SnapKit", package: "SnapKit"),
            .product(name: "RIBs", package: "RIBs"),
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
            .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
            .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
        ])

    ]
)
