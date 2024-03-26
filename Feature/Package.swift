// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Feature",
            targets: ["Home",
                      "HomeImpl"
                     ]),
    ],
    dependencies: [
        .package(path: "../ProxyModule"),
    ],
    targets: [
        .target(
          name: "Home",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
          ],
          path: "Home/Interface"
        ),
        .target(
          name: "HomeImpl",
          dependencies: [
            "Home",
            .product(name: "ProxyModule", package: "ProxyModule"),
          ],
          path: "Home/Implementation"
        ),
    ]
)
