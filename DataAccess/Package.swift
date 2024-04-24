// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataAccess",
    platforms: [
      .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataAccess",
            targets: ["DataAccess"]),
    ],
    dependencies: [
        .package(path: "../ProxyModule"),
        .package(path: "../Domain")
    ],
    targets: [
        .target(
          name: "DataAccess",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
            .product(name: "Domain", package: "Domain")
          ]),
        .testTarget(
            name: "DataAccessTests",
            dependencies: ["DataAccess"],
            path: "Tests"
        ),
    ]
)

