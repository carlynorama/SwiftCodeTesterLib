
public protocol CodeSketch<T> {
    associatedtype T
    var itemsToRun:Dictionary<String, () async throws -> T> { get }
}