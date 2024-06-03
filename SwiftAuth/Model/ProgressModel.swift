//import SwiftUI
//import Combine
//
//class ProgressModel: ObservableObject {
//    @Published var lessonProgress: [String: Float] = [
//        "Lesson1": 0.0,
//        "Lesson2": 0.0,
//        "Lesson3": 0.0,
//        "Lesson4": 0.0
//    ]
//}


import Foundation
import Combine

class ProgressModel: ObservableObject {
    @Published var lessonProgress: [String: Float] = [:]
}

