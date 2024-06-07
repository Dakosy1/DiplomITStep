import SwiftUI
import AVKit


struct CardView: View {
    @State private var isShowingAnswer = false
    @State private var player: AVPlayer = AVPlayer()
    let card: Card

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(radius: 10)

                VStack(spacing: 10) {
                    if let imageName = card.imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                    } else if let videoURL = card.videoURL {
                        VideoPlayer(player: player)
                            .frame(maxWidth: 300, maxHeight: isShowingAnswer ? 300 : 500) // Conditional height
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(12)
                            .shadow(radius: 5)
                            .onAppear {
                                player.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
                            }
                            .onTapGesture {
                                if player.timeControlStatus == .playing {
                                    player.pause()
                                } else {
                                    player.play()
                                }
                            }
                    }

                    if let prompt = card.prompt {
                        Text(prompt)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                }
                .padding(20)
                .multilineTextAlignment(.center)
            }

            if isShowingAnswer {
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
                    .transition(.slide)
                    .padding()
            }
        }
        .frame(minWidth: 360, minHeight: 400, maxHeight: .infinity) // Dynamic height for the card
        .onTapGesture {
            withAnimation {
                isShowingAnswer.toggle()
            }
        }
    }
}
