import SwiftUI

/// Adds a dashed-colored frame-size container to a view for UI debugging.
struct FrameSize: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader(content: overlay(for:)))
    }
    
    func overlay(for geometry: GeometryProxy) -> some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Rectangle()
                .strokeBorder(
                    style: StrokeStyle(lineWidth: 1, dash: [5])
                )
                .foregroundColor(color)
            Text("\(Int(geometry.size.width))x\(Int(geometry.size.height))")
                .font(.caption2)
                .foregroundColor(color)
                .padding(2)
        }
    }
}

public extension View {
    
    /// Applies the `FrameSize` modifier to the view.
    ///
    /// - Parameter color: The stroke `Color`. Default is `.blue`.
    @ViewBuilder func frameSize(_ color: Color = .blue) -> some View {
#if DEBUG
        // Makes sure the debugging frame doesn't ever show up in production.
        modifier(FrameSize(color: color))
#endif
    }
}

// MARK: - Preview

#Preview("FrameSize") {
    NavigationView {
        VStack {
            Text("Some text")
                .padding()
                .frameSize(.red)
            Rectangle()
                .fill(.yellow)
                .frame(maxWidth: 300, maxHeight: 100)
                .frameSize(.black)
            List(["1\t\t", "2\t\t", "3\t\t"], id: \.self) { number in
                Text(number)
                    .frameSize(.purple)
            }
            .frame(maxHeight: 300)
            .frameSize(.pink)
            Spacer()
                .frame(maxWidth:.infinity)
                .frameSize(.orange)
        }
        .navigationTitle("Navigation title")
        .frame(maxWidth: .infinity)
        .frameSize(.blue)
    }
}
