// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Act5",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        // An xtool project should contain exactly one library product,
        // representing the main app.
        .library(
            name: "Act5",
            targets: ["Act5"]
        ),
    ],
    targets: [
        .target(
            name: "Act5",
            resources: [.copy("Assets.xcassets")]
        ),
    ]
)
