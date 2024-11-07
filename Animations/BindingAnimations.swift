import SwiftUI

struct BindingAnimations: View {
    @State private var scaleAmount = 1.0

    var body: some View {
        print(scaleAmount)
        return VStack {
            Stepper(
                "Scale Amount",
                value: $scaleAmount.animation(.smooth),
                in: 1...10
            )
            Spacer()
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.indigo)
                .scaleEffect(scaleAmount)
        }
        .padding()
    }
}

#Preview {
    BindingAnimations()
}
