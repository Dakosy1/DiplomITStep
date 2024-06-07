import SwiftUI
import UniformTypeIdentifiers


struct Chapter1: View {
    @State private var selectedIndex = 0  // State to track the active card index
    
    let sampleCards = [
        Card(prompt: "Marhaba / مرحبا", answer: "Hello", imageName: "Hello"),
        Card(prompt: "Ma ismuka? / ما اسمك؟", answer: "What is your name?", videoURL: Bundle.main.url(forResource: "WhatsYourName", withExtension: "mov")),
        Card(prompt: "Kayfa Halak? / كيف حالك؟", answer: "How are you?", videoURL: Bundle.main.url(forResource: "HowAreUFrom", withExtension: "mov")),
        Card(prompt: "Shukran / شكرا", answer: "Thank you", videoURL: Bundle.main.url(forResource: "ThankYou", withExtension: "mov")),
        Card(prompt: "Min ayna anta? / من أين أنت؟", answer: "Where are you from?", videoURL: Bundle.main.url(forResource: "WhereRUFrom", withExtension: "mov"))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(Array(sampleCards.enumerated()), id: \.element.id) { index, card in
                        CardView(card: card)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 450)
                
                if selectedIndex == sampleCards.count - 1 {
                    NavigationLink(destination: MatchView(viewModel: MatchViewModel(items: [
                        MatchItem(word: "Apple"),
                        MatchItem(word: "Banana"),
                        MatchItem(word: "Cherry")
                    ]))) {
                        Text("Go to Next View")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}


struct MatchView: View {
    @ObservedObject var viewModel: MatchViewModel

    var body: some View {
        VStack {
            HStack {
                List(viewModel.leftItems) { item in
                    Button(action: {
                        viewModel.selectItem(item: item, fromLeftColumn: true)
                    }) {
                        Text(item.word)
                            .padding()
                            .foregroundColor(viewModel.selectedLeftItem == item ? .red : .black)
                    }
                }

                List(viewModel.rightItems) { item in
                    Button(action: {
                        viewModel.selectItem(item: item, fromLeftColumn: false)
                    }) {
                        Text(item.word)
                            .padding()
                            .foregroundColor(viewModel.selectedRightItem == item ? .red : .black)
                    }
                }
            }

            if viewModel.allItemsMatched {
                NavigationLink(destination: NextView()) {
                    Text("Proceed to Next View")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Match the Words")
    }
}
struct NextView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Congratulations! You've completed the game.")
                .font(.title)
            Button("Back to Home") {
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    Chapter1()
}
