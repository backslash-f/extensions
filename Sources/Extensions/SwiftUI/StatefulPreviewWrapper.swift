import SwiftUI

/// Makes Xcode's preview canvas fully functional for previewing
/// SwiftUI views that take `@Bindings` as input.
///
/// Usage example:
/// ```
/// #Preview {
///    StatefulPreviewWrapper([false]) { bindings in
///        YourView(binding: bindings[0])
///    }
/// }
/// ```
/// Or:
/// ```
/// #Preview {
///    let firstState = false
///    let secondState = true
///    let thirdState = true
///
///    let states = [firstState, secondState, thirdState]
///
///    return StatefulPreviewWrapper(states) { bindings in
///        YourView(binding: bindings[0])
///        AnotherView(binding: bindings[1])
///        YetAnotherView(binding: bindings[2])
///    }
/// }
/// ```
///
/// Extracted from [this thread](https://developer.apple.com/forums/thread/118589).
public struct StatefulPreviewWrapper<Value: Equatable, Content: View>: View {
    @State private var states: [Value]

    private var content: ([Binding<Value>]) -> Content

    public init(
        _ initialStates: [Value],
        content: @escaping ([Binding<Value>]) -> Content
    ) {
        self._states = State(initialValue: initialStates)
        self.content = content
    }

    public var body: some View {
        content(states.indices.map { index in
            Binding(
                get: { states[index] },
                set: { states[index] = $0 }
            )
        })
    }
}
