import ImageIO

extension CGImagePropertyOrientation: CaseIterable {

    /// Extends `CGImagePropertyOrientation` to conform to `CaseIterable`,
    /// providing a collection of all orientation cases.
    public static var allCases: [CGImagePropertyOrientation] = [
        .up,
        .upMirrored,
        .down,
        .downMirrored,
        .left,
        .leftMirrored,
        .right,
        .rightMirrored
    ]
}
