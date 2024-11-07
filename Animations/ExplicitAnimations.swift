import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap Me") {
            withAnimation(.bouncy) {
                animationAmount += 360
            }
        }.padding(16)
            .background(.indigo)
            .foregroundColor(.white)
            .clipShape(.rect(cornerRadius: 12))
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 0, z: 1))
    }
}

#Preview {
    ExplicitAnimations()
}
