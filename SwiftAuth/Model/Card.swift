import Foundation

struct Card: Identifiable {
    let id = UUID()
    var prompt: String?
    var answer: String
    var imageName: String?
    var videoURL: URL?  // Optional URL for video
}

struct MatchItem: Identifiable, Hashable {
    let id = UUID()
    var word: String
}
