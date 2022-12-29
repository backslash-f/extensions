import ImageIO

extension CGImagePropertyOrientation: CustomStringConvertible {
    
    /// Helper that makes instances of type `CGImagePropertyOrientation` print-friendly.
    ///
    /// E.g.: `print(orientation.description)` // UpMirrored.
    public var description: String {
        switch rawValue {
        case 1:
            return "\(rawValue), Up (Normal 0°)"
        case 2:
            return "\(rawValue), UpMirrored"
        case 3:
            return "\(rawValue), Down (Rotate 180°)"
        case 4:
            return "\(rawValue), DownMirrored"
        case 5:
            return "\(rawValue), LeftMirrored"
        case 6:
            return "\(rawValue), Right (Rotated 90° CCW (Counter-ClockWise))"
        case 7:
            return "\(rawValue), RightMirrored"
        case 8:
            return "\(rawValue), Left (Rotated 90° CW (ClockWise))"
        default:
            return "\(rawValue), Unknown"
        }
    }
}
