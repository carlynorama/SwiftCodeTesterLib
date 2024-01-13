

public struct ExampleSketch:CodeSketch {
    public typealias T = String

    public init() {}
    
    func firstMessage() async throws -> String {
        "up"
    }

    func secondMessage() async throws -> String {
        "down"
    }

    func thirdMessage() async throws -> String {
        "left"
    }

    func fourthMessage() async throws -> String {
        "right"
    }

    public var itemsToRun: Dictionary<String, () async throws -> String> {
        [ 
            "a" : firstMessage,
            "b" : secondMessage,
            "c" : thirdMessage,
            "d" : fourthMessage
        ]
    } 
}
