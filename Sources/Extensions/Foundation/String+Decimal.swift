import Foundation

/// Formats a numeric string to a specified number of decimal places.
///
/// This function takes a string that represents a numeric value and formats it
/// to have up to a specified number of decimal places. If the string is not a
/// valid number, it returns the original string.
/// The function uses `NumberFormatter` to ensure proper decimal formatting
/// according to the locale.
///
/// - Parameters:
///   - input: The string representing the numeric value to format.
///   - maximumFractionDigits: The maximum number of decimal places
///   to include in the formatted string.
/// - Returns: A string formatted to the specified number of decimal places.
/// If the input is not a valid number, returns the input unchanged.
///
/// - Examples:
///     ```
///     let result1 = formatDecimalString("351.6632141234", maximumFractionDigits: 2)
///     // Returns "351.66"
///
///     let result2 = formatDecimalString("235", maximumFractionDigits: 2)
///     // Returns "235"
///
///     let result3 = formatDecimalString("173.1", maximumFractionDigits: 2)
///     // Returns "173.1"
///
///     let result4 = formatDecimalString("123.456", maximumFractionDigits: 1)
///     // Returns "123.5"
///     ```
public func formatDecimalString(_ input: String, maximumFractionDigits: Int) -> String {
    guard let value = Double(input) else { return input }

    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = maximumFractionDigits
    formatter.numberStyle = .decimal

    return formatter.string(from: NSNumber(value: value)) ?? input
}
