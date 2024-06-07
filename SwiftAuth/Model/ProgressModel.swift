import Foundation
import Combine

class ProgressModel: ObservableObject {
    @Published var lessonProgress: [String: Float] = [:]
}

