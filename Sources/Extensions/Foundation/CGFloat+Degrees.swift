import Foundation

/// Provides convenient `CGFloat` constants for common angle measurements in radians.
///
/// Example 1:
/// Rotate a view by 90 degrees:
/// view.transform = CGAffineTransform(rotationAngle: .degrees_90)
///
/// Example 2:
/// Set a circular progress bar to half:
/// progressBar.progress = .degrees_180 / .degrees_360
public extension CGFloat {
    static let degrees_90    = CGFloat.pi / 2
    static let degrees_180   = CGFloat.pi
    static let degrees_270   = CGFloat.pi + (CGFloat.pi / 2)
    static let degrees_360   = 2 * CGFloat.pi
}
