import Foundation

public extension String {

    /// Formats a numeric string to a specified number of decimal places.
    ///
    /// This function takes a string that represents a numeric value and formats it
    /// to have up to a specified number of decimal places. If the string is not a
    /// valid number, it returns the original string.
    /// The function uses `NumberFormatter` to ensure proper decimal formatting
    /// according to the locale.
    ///
    /// - Parameters:
    ///   - fractionDigits: The maximum number of decimal places to include
    ///   in the formatted string (`NumberFormatter.maximumFractionDigits`).
    /// - Returns: A string formatted to the specified number of decimal places.
    /// If the input is not a valid number, returns the input unchanged.
    ///
    /// - Examples:
    ///     ```
    ///     let result1 = "351.6632141234".formatDecimalString(fractionDigits: 2)
    ///     // Returns "351.66"
    ///
    ///     let result2 = "235".formatDecimalString(fractionDigits: 2)
    ///     // Returns "235"
    ///
    ///     let result3 = "173.1".formatDecimalString(fractionDigits: 2)
    ///     // Returns "173.1"
    ///
    ///     let result4 = "123.456".formatDecimalString(fractionDigits: 1)
    ///     // Returns "123.4"
    ///     ```
    func formatDecimalString(fractionDigits: Int) -> String {
        guard let value = Double(self) else { return self }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = fractionDigits
        formatter.numberStyle = .decimal

        return formatter.string(from: NSNumber(value: value)) ?? self
    }
}
