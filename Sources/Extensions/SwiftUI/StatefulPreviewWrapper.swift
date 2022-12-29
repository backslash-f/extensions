import SwiftUI

/// Allows for previewing SwiftUI view that takes `@Bindings` as input.
/// Makes Xcode's preview canvas fully functional.
///
/// Usage example:
/// ```
/// struct YourView_Previews: PreviewProvider {
///     static var previews: some View {
///         StatefulPreviewWrapper(false) {
///             YourView(binding: $0)
///         }
///     }
/// }
/// ```
///
/// Extracted from [this thread](https://developer.apple.com/forums/thread/118589).
public struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value

    var content: (Binding<Value>) -> Content

    public var body: some View {
        content($value)
    }

    public init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
