import SwiftUI

struct AnimatedCircle1: View {
    @State private var scaleAmount = 1.0
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundStyle(.indigo)
            .scaleEffect(scaleAmount)
            .blur(radius: (scaleAmount - 1) * 3)
            .animation(.smooth(duration: 1).delay(1).repeatCount(3), value: scaleAmount)
            .onTapGesture {
                scaleAmount += 1
            }
    }
}

struct AnimatedCircle2: View {
    @State private var scaleAmount = 1.0
    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .foregroundStyle(.indigo)
            .overlay {
                Circle()
                    .stroke(.indigo)
                    .scaleEffect(scaleAmount)
                    .opacity(2 - scaleAmount)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false), value: scaleAmount)
            }
            .onAppear {
                scaleAmount = 2
            }
    }
}

#Preview {
    AnimatedCircle1()
}

#Preview {
    AnimatedCircle2()
}
