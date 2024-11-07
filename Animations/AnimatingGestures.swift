import SwiftUI


struct AnimatingGestures1: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(colors: [.indigo, .blue], startPoint: .top, endPoint: .bottom)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 12))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.smooth) {
                            dragAmount = value.translation
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy){
                            dragAmount = CGSize.zero
                        }
                    }
            )

    }
}

struct AnimatingGestures2: View {
    private let text = Array("ILOVEYOU3000")
    @State private var isDragChanged = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack {
            ForEach(0..<text.count, id: \.self) { index in
                let chaElement = text[index]
                Text(String(chaElement))
                    .padding(6)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .background(isDragChanged ? .indigo : .blue)
                    .clipShape(.rect(cornerRadius: 4))
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(index) / 20), value: dragAmount)
            }
        }.gesture(
            DragGesture()
                .onChanged { value in
                    dragAmount = value.translation
                }
                .onEnded { _ in
                    isDragChanged.toggle()
                    dragAmount = CGSize.zero
                }

        )
    }
}

#Preview {
    AnimatingGestures1()
}

#Preview {
    AnimatingGestures2()
}
