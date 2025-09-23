// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CleverTapSDK",
    platforms: [
        .iOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "CleverTapSDK",
            targets: ["CleverTapSDKWrapper"]
        ),
        .library(
            name: "CleverTapLocation",
            targets: ["CleverTapLocation"]
        ),
        .library(
            name: "CleverTapWatchOS",
            targets: ["CleverTapWatchOS"]
        )
    ],
    dependencies: [
        // ✅ SDWebImage via SPM dependency (not a binary target)
        .package(
            name: "SDWebImage",
            url: "https://github.com/SDWebImage/SDWebImage.git",
            from: "5.21.0"
        )
    ],
    targets: [
        // ❌ Removed the SDWebImage binaryTarget

        .binaryTarget(
            name: "CleverTapSDK",
            url: "https://d1new0xr8otir0.cloudfront.net/CleverTapSDK-7.3.3.xcframework.zip",
            checksum: "9a3a8b7d8118e8d8c5b32744e3d979d051c634d3bddf7542089fb7f3dc3de500"
        ),

        .target(
            name: "CleverTapLocation",
            path: "CleverTapLocation",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("./"),
                .headerSearchPath("CleverTapLocation/"),
                .headerSearchPath("CleverTapLocation/Classes/"),
                .headerSearchPath("CleverTapLocation/Classes")
            ],
            linkerSettings: [
                .linkedFramework("CoreLocation")
            ]
        ),

        .target(
            name: "CleverTapSDKWrapper",
            dependencies: [
                // 👉 Depend on CleverTap binary target
                "CleverTapSDK",
                // 👉 Pull SDWebImage from the SPM dependency
                .product(name: "SDWebImage", package: "SDWebImage")
            ],
            path: "CleverTapSDKWrapper",
            linkerSettings: [
                .linkedLibrary("sqlite3")
                // ❌ Removed .linkedFramework("SDWebImage") — handled by SPM product
            ]
        ),

        .target(
            name: "CleverTapWatchOS",
            dependencies: [],
            path: "CleverTapWatchOS",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("./"),
                .headerSearchPath("CleverTapWatchOS/")
            ]
        )
    ]
)
