
## Getting Started

```bash
swift package init --type tool
touch README.md
swift run
> Hello, world!
```

```swift
let package = Package(
    name: "2024SwiftNotes",
    platforms: [.macOS(.v13)],
//... argument parser will already be in the dependencies because of `tool`
```

