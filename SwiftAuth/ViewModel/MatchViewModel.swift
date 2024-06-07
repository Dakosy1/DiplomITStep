import SwiftUI

class MatchViewModel: ObservableObject {
    @Published var leftItems: [MatchItem]
    @Published var rightItems: [MatchItem]
    @Published var selectedLeftItem: MatchItem?
    @Published var selectedRightItem: MatchItem?

    init(items: [MatchItem]) {
        self.leftItems = items
        self.rightItems = items.shuffled()
    }

    func selectItem(item: MatchItem, fromLeftColumn: Bool) {
        if fromLeftColumn {
            selectedLeftItem = item
        } else {
            selectedRightItem = item
        }

        if let left = selectedLeftItem, let right = selectedRightItem, left == right {
            leftItems.removeAll { $0.id == left.id }
            rightItems.removeAll { $0.id == right.id }
            selectedLeftItem = nil
            selectedRightItem = nil
        }
    }

    var allItemsMatched: Bool {
        return leftItems.isEmpty && rightItems.isEmpty
    }
}
//class MatchViewModel: ObservableObject {
//    @Published var leftItems: [MatchItem]
//    @Published var rightItems: [MatchItem]
//    @Published var selectedLeftItem: MatchItem?
//    @Published var selectedRightItem: MatchItem?
//
//    // Computed property to determine if all items are matched
//    var allItemsMatched: Bool {
//        return leftItems.isEmpty && rightItems.isEmpty
//    }
//
//    init(items: [MatchItem]) {
//        self.leftItems = items
//        self.rightItems = items.shuffled()
//    }
//
//    func selectItem(item: MatchItem, fromLeftColumn: Bool) {
//        if fromLeftColumn {
//            if selectedLeftItem == item {
//                selectedLeftItem = nil
//            } else {
//                selectedLeftItem = item
//            }
//        } else {
//            if selectedRightItem == item {
//                selectedRightItem = nil
//            } else {
//                selectedRightItem = item
//            }
//        }
//
//        if let left = selectedLeftItem, let right = selectedRightItem, left.word == right.word {
//            // Remove matched items
//            DispatchQueue.main.async {
//                self.leftItems.removeAll { $0.id == left.id }
//                self.rightItems.removeAll { $0.id == right.id }
//                self.selectedLeftItem = nil
//                self.selectedRightItem = nil
//            }
//        }
//    }
//}
