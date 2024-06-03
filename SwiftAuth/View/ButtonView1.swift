import SwiftUI

struct ButtonView1: View {
    var label: String
    @Binding var progress: Float

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            ProgressBar(progress: $progress)
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    ButtonView1(label: "Lesson 1", progress: .constant(0.5))
}
