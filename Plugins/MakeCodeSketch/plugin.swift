import PackagePlugin

@main
struct MakeCodeSketch: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, 
                        arguments: [String]) async throws {
        var message = "do I see this?"
        print("do I see this?\nhow about now?")
        let contributors = Set(message.components(separatedBy: CharacterSet.newlines)).sorted().filter { !$0.isEmpty }
        try contributors.joined(separator: "\n").write(toFile: "CONTRIBUTORS.txt", atomically: true, encoding: .utf8)
    }
    
    
}
