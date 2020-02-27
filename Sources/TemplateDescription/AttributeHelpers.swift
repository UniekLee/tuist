import Foundation

public func getAttribute(for name: String) throws -> String {
    let jsonDecoder = JSONDecoder()
    guard
        let attributesIndex = CommandLine.arguments.firstIndex(of: "--attributes"),
        CommandLine.arguments.endIndex > attributesIndex + 1,
        let data = CommandLine.arguments[attributesIndex + 1].data(using: .utf8)
    else { fatalError() }
    
    let parsedAttributes = try jsonDecoder.decode([ParsedAttribute].self, from: data)
    guard let value = parsedAttributes.first(where: { $0.name == name })?.value else { fatalError() }
    return value
}

public struct Content {
    public init(_ generateContent: () throws -> String) {
        do {
            dumpIfNeeded(try generateContent())
        } catch let error {
            dumpIfNeeded(error.localizedDescription)
        }
    }
}

public struct ParsedAttribute: Codable {
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    public let name: String
    public let value: String
}
