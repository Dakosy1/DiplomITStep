import SwiftUI

struct CardFlipHero: View {
    @State private var currentCardIndex = 0
    @State private var isFlipped = [Bool](repeating: false, count: 10)
    
    var body: some View {
        VStack {
            if currentCardIndex < isFlipped.count {
                FlipView(
                    front: CardFace(text: "Card \(currentCardIndex + 1) - Tap to flip", colorBg: .gray),
                    back: CardBack(),
                    isFlipped: $isFlipped[currentCardIndex]
                )
                .frame(width: 220, height: 320)
                .padding()
                
                Button("Next Card") {
                    if currentCardIndex < isFlipped.count - 1 {
                        currentCardIndex += 1
                    }
                }
                .disabled(!isFlipped[currentCardIndex]) // Enable the button only if the current card is flipped
                .padding()
            } else {
                Text("You've finished all cards!")
                    .padding()
            }
        }
    }
}

struct FlipView<FrontView: View, BackView: View>: View {
    var front: FrontView
    var back: BackView
    @Binding var isFlipped: Bool

    var body: some View {
        ZStack {
            if isFlipped {
                back
            } else {
                front
            }
        }
        .onTapGesture {
            withAnimation(.linear(duration: 0.8)) {
                isFlipped.toggle()
            }
        }
        .rotation3DEffect(Angle.degrees(isFlipped ? 180 : 0), axis: (0, 1, 0))
    }
}

struct CardFace: View {
    var text: String
    var colorBg: Color

    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 220, height: 320)
            .background(colorBg)
            .cornerRadius(20)
    }
}

struct CardBack: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .padding()
        }
        .frame(width: 220, height: 320)
        .background(Color.orange)
        .cornerRadius(20)
    }
}

struct CardFlipHero_Preview: PreviewProvider {
    static var previews: some View {
        CardFlipHero()
    }
}

//#Preview{
//    
//}
//struct SimpleFlipper : View {
//      @State var flipped = false
//
//      var body: some View {
//
//            let flipDegrees = flipped ? 180.0 : 0
//
//            return VStack{
//                  Spacer()
//
//                  ZStack() {
//                        Text("Front").placedOnCard(Color.yellow).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
//                        Text("Back").placedOnCard(Color.blue).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
//                  }
//                  .animation(.easeInOut(duration: 0.8))
//                  .onTapGesture { self.flipped.toggle() }
//                  Spacer()
//            }
//      }
//}
//
//extension View {
//
//      func flipRotate(_ degrees : Double) -> some View {
//            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
//      }
//
//      func placedOnCard(_ color: Color) -> some View {
//            return padding(5).frame(width: 250, height: 150, alignment: .center).background(color)
//      }
//}

//protocol NVFlipCardPresenterProtocol: ObservableObject {
//    var isFlipped: Bool { get }
//    func flipButtonTapped()
//}
//
//class NVFlipCardPresenter: NVFlipCardPresenterProtocol {
//    @Published var isFlipped: Bool = false
//
//    func flipButtonTapped() {
//        isFlipped.toggle()
//    }
//}
//
//struct NVFlipCardView: View {
//    @ObservedObject var presenter: NVFlipCardPresenter
//    
//    var body: some View {
//        Rectangle()
//            .foregroundColor(presenter.isFlipped ? .blue : .green)
//            .cornerRadius(10)
//            .frame(width: 300, height: 500)
//            .shadow(color: .gray, radius: 10)
//            .onTapGesture {
//                presenter.flipButtonTapped()
//            }
//            .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//            .animation(.default, value: presenter.isFlipped)
//    }
//}
//
//
