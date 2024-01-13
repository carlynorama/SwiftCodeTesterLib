import PackagePlugin
import Foundation

@main
struct MakeCodeSketch: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, 
                        arguments: [String]) async throws {
        let message = "do I see this?\nhow about now?"
        let fileName = "codeSketch" + ".txt"
        //let location = context.pluginWorkDirectory // Is the BUILD folder
        var location = context.package.directory.appending([fileName])
        print(message, "\n" ,location)
        let contributors = Set(message.components(separatedBy: CharacterSet.newlines)).sorted().filter { !$0.isEmpty }
        try contributors.joined(separator: "\n").write(toFile: location.string, atomically: true, encoding: .utf8)
    }
    
    
}
