import PackagePlugin
import Foundation


//TODO: Link to ArgumentParser compiled tool?
//https://github.com/apple/swift-package-manager/blob/main/Documentation/Plugins.md#implementing-the-command-plugin-script


@main
struct MakeCodeSketch: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, 
                        arguments: [String]) async throws {
        var argExtractor = ArgumentExtractor(arguments)
        let targetNames = argExtractor.extractOption(named: "target")
        let sketchNames = argExtractor.extractOption(named: "named")
        
        var fileName =  sketchNames.isEmpty ? "NewCodeSketch" : sketchNames[0]
        var fileContent = makeBasicCodeSketch(name: fileName)
        fileName = fileName + ".swift"
        
        // are not targets?
        let targets = try? context.package.targets(named: targetNames)
        if let targets {
            for target in targets {
                //guard let targetSource = target.sourceModule else { continue }
                try writeToFile(location: target.directory.appending([fileName]), content: fileContent)
            }
        } else {
            fileContent.append("\n//MARK: Command Arguments\n/*\(arguments)*/")
            try writeToFile(location: context.package.directory.appending([fileName]), content: fileContent)
            
        }
        
    }
    
    func writeToFile(location:Path, content:some StringProtocol) throws {
        try content.write(toFile: location.string, atomically: true, encoding: .utf8)
    }
    
    
    func makeBasicCodeSketch(name:String) -> String {
        """
public struct \(name):CodeSketch {
    public typealias T = String

    public init() {}
    
    func firstFunction() async throws -> String {
        "up"
    }

    func secondFunction() async throws -> String {
        "down"
    }

    func thirdFunction() async throws -> String {
        "left"
    }

    func fourthFunction() async throws -> String {
        "right"
    }

    public var itemsToRun: Dictionary<String, () async throws -> String> {
        [
            "a" : firstFunction,
            "b" : secondFunction,
            "c" : thirdFunction,
            "d" : fourthFunction
        ]
    }
}
"""
    }
    
}
