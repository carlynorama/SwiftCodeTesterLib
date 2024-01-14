import PackagePlugin
import Foundation

@main
struct MakeCodeSketch: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, 
                        arguments: [String]) async throws {
        var message = "do I see this?\nhow about now?"
        let fileName = "codeSketch" + ".txt"
        //let location = context.pluginWorkDirectory // Is the BUILD folder
        
        message.append("\norigin: \(context.package.origin)")
        message.append("\ndirectory: \(context.package.directory)")
        message.append("\nsourceModules: \(context.package.sourceModules)")
        message.append("\nproducts:\(context.package.products)")
        message.append("\ntargets:\(context.package.targets)")
        message.append("\narguments:\(arguments)")
        
        
        var location = context.package.directory.appending([fileName])
        //print(message, "\n")
        let contributors = Set(message.components(separatedBy: CharacterSet.newlines)).sorted().filter { !$0.isEmpty }
        try contributors.joined(separator: "\n").write(toFile: location.string, atomically: true, encoding: .utf8)
    }
    
    
}
