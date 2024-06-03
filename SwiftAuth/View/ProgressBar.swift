import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.green

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeOut(duration: 2.0), value: self.progress)
        }
    }
}

#Preview {
    ProgressBar(progress: .constant(0.5))
}
