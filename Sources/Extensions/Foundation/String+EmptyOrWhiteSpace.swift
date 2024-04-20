import Foundation

public extension String {

    /// Returns true if `the` string is empty or contains only whitespace and newline characters.
    var isEmptyOrWhiteSpace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
