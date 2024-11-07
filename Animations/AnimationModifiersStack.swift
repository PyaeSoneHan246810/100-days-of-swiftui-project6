import SwiftUI

struct AnimationModifiersStack: View {
    @State private var isEnabled = false
    @State private var scaleAmount = 1.0
    @State private var rotationDegree = 0.0
    var body: some View {
        Button("Tap Me") {
            isEnabled.toggle()
            scaleAmount += 1.0
            withAnimation(.bouncy) {
                rotationDegree += 360.0
            }
        }.buttonStyle(.borderedProminent)
            .controlSize(.small)
            .tint(isEnabled ? .blue : .indigo)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: isEnabled ? 60 : 0))
            .animation(.spring(duration: 1), value: isEnabled)
            .scaleEffect(scaleAmount)
            .animation(.smooth, value: scaleAmount)
            .rotation3DEffect(.degrees(rotationDegree), axis: (x: 0, y: 0, z: 1))
    } 
}

#Preview {
    AnimationModifiersStack()
}
