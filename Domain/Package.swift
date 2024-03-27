// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
      .iOS(.v16)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Authentication",
                      "AuthenticationImpl"
                     ]),
    ],
    dependencies: [
        .package(path: "../ProxyModule"),
    ],
    targets: [
        .target(
          name: "Authentication",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
          ],
          path: "Authentication/Interface"
        ),
        .target(
          name: "AuthenticationImpl",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
          ],
          path: "Authentication/Implementation"
        ),

    ]
)
