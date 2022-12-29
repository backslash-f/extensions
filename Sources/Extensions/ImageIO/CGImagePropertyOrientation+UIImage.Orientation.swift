#if os(iOS) || os(tvOS)
import ImageIO
import UIKit

/*
 The CGImagePropertyOrientation type covers the same set of orientation names available
 in from the UIImage.Orientation type, but the underlying numeric values of each type
 do not match. (For example, the "left mirrored" orientation has an underlying value of
 5 in CGImagePropertyOrientation, but an underlying value of 7 in UIImage.Orientation.)
 If you have an orientation value in one type and need a semantically equivalent value in
 the other, use the functions below.
 
 Source: https://apple.co/3GnXuPE
 */

public extension CGImagePropertyOrientation {
    init?(_ uiOrientation: UIImage.Orientation) {
        switch uiOrientation {
        case .up:
            self = .up
        case .upMirrored:
            self = .upMirrored
        case .down:
            self = .down
        case .downMirrored:
            self = .downMirrored
        case .left:
            self = .left
        case .leftMirrored:
            self = .leftMirrored
        case .right:
            self = .right
        case .rightMirrored:
            self = .rightMirrored
        @unknown default:
            return nil
        }
    }
}

public extension UIImage.Orientation {
    init(_ cgOrientation: CGImagePropertyOrientation) {
        switch cgOrientation {
        case .up:
            self = .up
        case .upMirrored:
            self = .upMirrored
        case .down:
            self = .down
        case .downMirrored:
            self = .downMirrored
        case .left:
            self = .left
        case .leftMirrored:
            self = .leftMirrored
        case .right:
            self = .right
        case .rightMirrored:
            self = .rightMirrored
        }
    }
}
#endif
