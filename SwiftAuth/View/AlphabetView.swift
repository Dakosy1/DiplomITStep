import SwiftUI

struct AlphabetView: View {
    @StateObject private var viewModel = AlphabetViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
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
                
                NavigationLink(destination: AlphabetLearnerButtonView()) {
                    Text("Learn the Letters")
                        .textCase(.uppercase)
                        .frame(width: 325, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                        .padding(.bottom, 20)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.alphabet) { letter in
                            VStack {
                                Text(letter.letter)
                                    .font(.largeTitle)
                                Text(letter.transcription)
                                    .font(.caption)
                                    .padding(.top, 0)
                            }
                            .frame(width: 70, height: 70)
                            .background(Color.solidGB.opacity(0.2))
                            .cornerRadius(8.0)
                        }
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    AlphabetView()
}
