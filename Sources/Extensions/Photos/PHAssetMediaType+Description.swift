import Photos

extension PHAssetMediaType: CustomStringConvertible {
    
    /// Helper that makes instances of type `PHAssetMediaType` print-friendly.
    ///
    /// E.g.: `print(phAssetMediaType.description)` // Image.
    public var description: String {
        switch rawValue {
        case 1:
            return "\(rawValue), Image"
        case 2:
            return "\(rawValue), Video"
        case 3:
            return "\(rawValue), Audio"
        default:
            return "\(rawValue), Unknown"
        }
    }
}
