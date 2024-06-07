import SwiftUI
import AVFoundation

struct AlphabetView: View {
    @StateObject private var viewModel = AlphabetViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            VStack {
                headerText
                learnLettersButton
                lettersGrid
            }
            .padding()
        }
    }

    // Header Text
    var headerText: some View {
        VStack {
            Text("Let's Learn Arabic!")
                .bold()
                .font(.largeTitle)
                .padding(.top, 40)
            Text("Get to know the Arabic")
                .font(.headline)
            Text("writing system")
                .font(.headline)
                .padding(.bottom, 20)
        }
    }

    // Button to start learning letters
    var learnLettersButton: some View {
        NavigationLink(destination: AlphabetLearnerButtonView()) {
            Text("Learn the Letters")
                .textCase(.uppercase)
                .frame(width: 325, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8.0)
                .padding(.bottom, 20)
        }
    }

    // Grid of letters
    var lettersGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(viewModel.alphabet) { letter in
                    Button(action: {
                        SoundManager.shared.playSound(named: letter.audioFileName)
                    }) {
                        VStack {
                            Text(letter.letter)
                                .font(.largeTitle)
                            Text(letter.transcription)
                                .font(.caption)
                                .padding(.top, 0)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8.0)
                    }
                }
            }
            .padding()
        }
    }
}


class SoundManager {
    static let shared = SoundManager()
    var audioPlayer: AVAudioPlayer?

    func playSound(named soundFileName: String) {
        guard let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: nil) else {
            print("Sound file not found.")
            return
        }
        let url = URL(fileURLWithPath: bundlePath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            print("Couldn't play sound file: \(error.localizedDescription)")
        }
    }
}


// Preview
struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}


//import SwiftUI
//
//struct AlphabetView: View {
//    @StateObject private var viewModel = AlphabetViewModel()
//
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Let's Learn Arabic!")
//                    .bold()
//                    .font(.largeTitle)
//                    .padding(.top, 40)
//                Text("Get to know the Arabic")
//                    .font(.headline)
//                Text("writing system")
//                    .font(.headline)
//                    .padding(.bottom, 20)
//                
//                NavigationLink(destination: AlphabetLearnerButtonView()) {
//                    Text("Learn the Letters")
//                        .textCase(.uppercase)
//                        .frame(width: 325, height: 50)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8.0)
//                        .padding(.bottom, 20)
//                }
//                
//                ScrollView {
//                    LazyVGrid(columns: columns, spacing: 15) {
//                        ForEach(viewModel.alphabet) { letter in
//                            VStack {
//                                Text(letter.letter)
//                                    .font(.largeTitle)
//                                Text(letter.transcription)
//                                    .font(.caption)
//                                    .padding(.top, 0)
//                            }
//                            .frame(width: 70, height: 70)
//                            .background(Color.solidGB.opacity(0.2))
//                            .cornerRadius(8.0)
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//
//
//#Preview {
//    AlphabetView()
//}
