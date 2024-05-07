//
//  String+Split.swift
//
//
//  Created by Fernando Fernandes on 07.05.24.
//

import Foundation

@available(iOS 16.0, *)
public extension String {

    /// Returns the first component of the string up to, but not including, the first occurrence of the
    /// specified separator. If the separator is not found in the string, the entire string is returned.
    ///
    /// - Parameter separator: The string used to divide the original string into components, e.g., `":"`
    /// - Returns: The substring from the start of the original string to just before the separator,
    /// or the entire string if the separator is not found.
    ///
    /// ## Examples:
    /// ```
    /// "BTC:USDT".firstComponentSeparatedBy(separator: ":") // Returns "BTC"
    /// "BTC:US".firstComponentSeparatedBy(separator: ":")   // Returns "BTC"
    /// "BTC:".firstComponentSeparatedBy(separator: ":")     // Returns "BTC"
    /// "BTC".firstComponentSeparatedBy(separator: ":")      // Returns "BTC"
    /// "BTC".firstComponentSeparatedBy(separator: "!!")     // Returns "BTC"
    /// ```
    func firstComponentSeparatedBy(_ separator: String) -> String {
        let parts = self.split(
            separator: separator,
            maxSplits: 1,
            omittingEmptySubsequences: true
        )
        return parts.isEmpty ? self : String(parts[0])
    }
}
