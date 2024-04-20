import SwiftUI

#if os(macOS)
#else
/// Produces a shape with rounded corners.
///
/// Allows specifying which corner is to be rounded. For example:
/// ```
/// .cornerRadius(20, corners: [.topLeft, .bottomRight])
/// ```
///
/// [source](https://stackoverflow.com/a/58606176/584548)
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - Preview

#Preview("RoundedCorner, [.topLeft, .topRight]") {
    VStack(spacing: .zero) {
        Rectangle()
            .fill(.orange)
            .frame(width: 300, height: 200)
            .cornerRadius(40, corners: [.topLeft, .topRight])
        Rectangle()
            .frame(height: 2)
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
    }
}
#endif
