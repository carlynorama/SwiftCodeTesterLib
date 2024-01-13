import PackagePlugin
import Foundation

@main
struct MakeCodeSketch: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, 
                        arguments: [String]) async throws {
        let message = "do I see this?\nhow about now?"
        print(message)
        let contributors = Set(message.components(separatedBy: CharacterSet.newlines)).sorted().filter { !$0.isEmpty }
        try contributors.joined(separator: "\n").write(toFile: "CONTRIBUTORS.txt", atomically: true, encoding: .utf8)
    }
    
    
}
