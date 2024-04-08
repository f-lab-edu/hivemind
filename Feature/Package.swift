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
        .library(
            name: "FeatureImpl",
            targets: ["HomeImpl",
                      "LoginImpl",
                     ]),
        .library(name: "Auth",
                 targets: ["Auth"])
    ],
    dependencies: [
        .package(path: "../ProxyModule"),
        .package(path: "../Domain")
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
        .target(
          name: "Login",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
            .product(name: "AuthRepositories", package: "Domain") // 이 부분 추가

          ],
          path: "Login/Interface"
        ),
        .target(
          name: "LoginImpl",
          dependencies: [
            "Login",
            .product(name: "ProxyModule", package: "ProxyModule"),
            
          ],
          path: "Login/Implementation"
        ),
        .target(
          name: "Auth",
          dependencies: [
            .product(name: "ProxyModule", package: "ProxyModule"),
            .product(name: "AuthRepositories", package: "Domain")
          ],
          path: "Auth"
        ),
    ]
)
