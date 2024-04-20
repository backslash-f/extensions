import SwiftUI

public extension View {
    
    /// Allows applying view modifiers based on some criteria.
    ///
    /// Usage example:
    ///
    /// ```
    /// MyView()
    ///   .modify {
    ///     if #available(iOS 16.0, *) {
    ///       $0.sheet(isPresented: $isPresented) {
    ///         MyModal()
    ///           .presentationDetents([.height(200)]) // Only in iOS 16
    ///         }
    ///     } else {
    ///       $0.sheet(isPresented: $isPresented) {
    ///         MyModal()
    ///     }
    /// ```
    /// or without fallback:
    ///
    /// ```
    /// Text("LOLSTRING")
    ///   .modify {
    ///     if someCondition {
    ///       $0.badge(2)
    ///     }
    ///     // Fallback not required. The view will stay untouched.
    /// ```
    ///
    /// [source](https://stackoverflow.com/a/71203870/584548)
    @ViewBuilder func modify<Content: View>(@ViewBuilder _ transform: (Self) -> Content?) -> some View {
        if let view = transform(self), !(view is EmptyView) {
            view
        } else {
            self
        }
    }
}
