import Foundation

public extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    ///
    /// [source](https://stackoverflow.com/a/30593673/584548)
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
