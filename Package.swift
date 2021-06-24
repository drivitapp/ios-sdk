// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Drivit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Drivit",
            targets: ["Drivit"])
    ],
//    dependencies: [
//        .package(
//            name: "Firebase",
//            url: "https://github.com/firebase/firebase-ios-sdk.git",
//            from: "8.1.0")
//    ],
    targets: [
//        .target(
//            name: "Drivit",
//            dependencies: [
//                .product(name: "FirebaseMessaging", package: "Firebase")
//            ]
//        ),
        .binaryTarget(
            name: "Drivit",
            path: "Products/xcframework/Drivit.xcframework")
    ]
)
