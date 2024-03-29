// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCodeTesterLib",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "CodeSketch", targets: ["CodeSketch"]),
        .plugin(name: "MakeCodeSketch", targets: ["MakeCodeSketch"]),
        .plugin(name: "TellMeAboutYourself", targets: ["TellMeAboutYourself"])
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
        ),
        .plugin(
            name: "TellMeAboutYourself",
            capability: .command(intent: .custom(verb: "about",
                                                 description: "See info about the package"),
                                 permissions: [.writeToPackageDirectory(reason: "This plugin creates a file with information about the plugin and the package it's running on.")])
        )
    ]
)
