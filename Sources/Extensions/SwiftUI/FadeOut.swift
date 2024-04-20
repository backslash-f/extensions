import SwiftUI

/// Fades out the edge of a view based on a given `FadeOut.Edge`.
public struct FadeOut: ViewModifier {
    /// The edge to be faded out.
    public let edge: Edge

    public enum Edge: String {
        case top
        case bottom
        case leading
        case trailing
    }

    public func body(content: Content) -> some View {
        content
            .mask(
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1)
                        ]
                    ),
                    startPoint: params.startPoint,
                    endPoint: params.endPoint
                )
            )
    }

    // MARK: - Private

    private var params: (startPoint: UnitPoint, endPoint: UnitPoint) {
        switch edge {
        case .top:
            return (.bottom, .top)
        case .bottom:
            return (.top, .bottom)
        case .leading:
            return (.trailing, .leading)
        case .trailing:
            return (.leading, .trailing)
        }
    }
}

public extension View {
    func fadeOut(edge: FadeOut.Edge) -> some View {
        modifier(FadeOut(edge: edge))
    }
}

// MARK: - Preview

#Preview("FadeOut, .leading edge") {
    Rectangle()
        .fill(.blue)
        .fadeOut(edge: .leading)
}
