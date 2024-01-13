// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCodeTesterLib",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "CodeSketch", targets: ["CodeSketch"]),
        .plugin(name: "MakeCodeSketch", targets: ["MakeCodeSketch"])
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

/*
 Package(
 id: "swiftcodetesterlib",
 displayName: "SwiftCodeTesterLib",
 directory: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib,
 origin: PackagePlugin.PackageOrigin.root,
 toolsVersion: PackagePlugin.ToolsVersion(major: 5, minor: 9, patch: 0),
 dependencies: [],
 products: [
 PackagePlugin.LibraryProduct(id: "0", name: "CodeSketch", targets: [PackagePlugin.SwiftSourceModuleTarget(id: "0", name: "CodeSketch", kind: PackagePlugin.ModuleKind.generic, directory: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch, dependencies: [], moduleName: "CodeSketch", sourceFiles: PackagePlugin.FileList(files: [PackagePlugin.File(path: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch/CodeSketch.swift, type: PackagePlugin.FileType.source), PackagePlugin.File(path: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch/CodeSketchError.swift, type: PackagePlugin.FileType.source), PackagePlugin.File(path: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch/ExampleSketch.swift, type: PackagePlugin.FileType.source)]), compilationConditions: [], linkedLibraries: [], linkedFrameworks: [])], kind: PackagePlugin.LibraryProduct.Kind.automatic)
 ],
 targets: [
 PackagePlugin.SwiftSourceModuleTarget(id: "0", name: "CodeSketch", kind: PackagePlugin.ModuleKind.generic, directory: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch, dependencies: [], moduleName: "CodeSketch", sourceFiles: PackagePlugin.FileList(files: [PackagePlugin.File(path: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch/CodeSketch.swift, type: PackagePlugin.FileType.source), PackagePlugin.File(path: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch/CodeSketchError.swift, type: PackagePlugin.FileType.source), PackagePlugin.File(path: /Users/Carlyn/Developer/GitHub/SwiftNotes2024/SwiftCodeTesterLib/Sources/CodeSketch/ExampleSketch.swift, type: PackagePlugin.FileType.source)]), compilationConditions: [], linkedLibraries: [], linkedFrameworks: [])
 ]
 )
 */
