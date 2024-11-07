import SwiftUI

struct CustomAnimation: View {
    @State private var isRedShown = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .clipShape(.rect(cornerRadius: 12))
            if isRedShown {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 12))
                    .transition(.pivot)
            }
        }.onTapGesture {
            withAnimation {
                isRedShown.toggle()
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

#Preview {
    CustomAnimation()
}
