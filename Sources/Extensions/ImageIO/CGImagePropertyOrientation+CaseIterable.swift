import ImageIO

extension CGImagePropertyOrientation: CaseIterable {
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
