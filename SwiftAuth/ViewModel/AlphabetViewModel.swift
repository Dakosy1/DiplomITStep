import Foundation

class AlphabetViewModel: ObservableObject {
    @Published var alphabet: [ArabicLetter] = arabicAlphabet
}
