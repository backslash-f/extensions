import Foundation

public extension Optional {
    
    /// Allows for printing "nil" (when the optional is nil) or the wrapped value itself.
    ///
    /// E.g.: "123" instead of "Optional(123)"
    func toString() -> String {
        self.map { String(describing: $0) } ?? "nil"
    }
}
