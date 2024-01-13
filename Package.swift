// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCodeTesterLib",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "CodeSketch", targets: ["CodeSketch"]),
    ],
    targets: [
        .target(
            name: "CodeSketch",
            path: "Sources/CodeSketch"
        ),
        //MARK: Plugins
        .plugin(
            name: "MakeCodeSketch",
            capability: .command(intent: .custom(verb: "make-sketch", 
                                                 description: "Create an new code sketch"), 
                                                 permissions: [.writeToPackageDirectory(reason: "This plugin creates a new code sketch file.")])
        )
    ]
)
