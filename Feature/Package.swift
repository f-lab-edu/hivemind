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
                      "Login"
                     ]),
    ],
    dependencies: [
        .package(path: "../ProxyModule"),
        .package(path: "../Domain"),
        .package(path: "../DataAccess")
    ],
    targets: [
        .target(
          name: "Home",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
          ],
          path: "Home"
        ),
        .target(
          name: "Login",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
            .product(name: "Domain", package: "Domain"),
            .product(name: "DataAccess", package: "DataAccess")
          ],
          path: "Login"
        ),
    ]
)
