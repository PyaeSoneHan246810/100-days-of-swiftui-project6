import SwiftUI

struct Transitions: View {
    @State private var isVisible = false
    var body: some View {
        VStack {
            if isVisible {
                Rectangle()
                    .fill(.indigo)
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 40))
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            Button("Toggle Visibility") {
                withAnimation(.smooth) {
                    isVisible.toggle()
                }
            }.foregroundStyle(.indigo)
        }
    }
}

#Preview {
    Transitions()
}
