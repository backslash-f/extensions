import Photos

extension PHAssetMediaSubtype: CustomStringConvertible {
    
    /// Helper that makes instances of type `PHAssetMediaSubtype` print-friendly.
    ///
    /// E.g.: `print(phAssetMediaType.description)` // photoPanorama.
    public var description: String {
        let result = Self.debugDescriptions.filter { contains($0.value) }
        if result.isEmpty {
            let prefix = (rawValue == 0) ? ", None" : ""
            return "\(rawValue)\(prefix)"
        } else {
            return result
                .map { $0.description }
                .joined(separator: ", ")
        }
    }
    
    public static var debugDescriptions: [(value: Self, description: String)] = [
        (.photoPanorama, "photoPanorama"),
        (.photoHDR, "photoHDR"),
        (.photoScreenshot, "photoScreenshot"),
        (.photoLive, "photoLive"),
        (.photoDepthEffect, "photoDepthEffect"),
        (.videoStreamed, "videoStreamed"),
        (.videoHighFrameRate, "videoHighFrameRate"),
        (.videoTimelapse, "videoTimelapse"),
        (.videoCinematic, "videoCinematic") // Needs iOS 15+
    ]
}
