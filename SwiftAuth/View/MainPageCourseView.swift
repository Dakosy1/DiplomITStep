import SwiftUI
import Firebase
import FirebaseFirestore

struct MainPageProgressViewCourse: View {
    @ObservedObject var progressModel: ProgressModel
    var lesson: String
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            ProgressBar(progress: Binding(
                get: { progressModel.lessonProgress[lesson] ?? 0.0 },
                set: { progressModel.lessonProgress[lesson] = $0 }
            ))
            .frame(width: 160.0, height: 160.0)
            .padding(20.0)
            .onAppear {
                self.loadProgress()
            }
            Button("Increment") {
                if progressModel.lessonProgress[lesson] ?? 0.0 < 1.0 {
                    progressModel.lessonProgress[lesson, default: 0.0] += 0.10
                } else {
                    progressModel.lessonProgress[lesson] = 0.0
                }
                self.saveProgress()
            }
        }
    }

    func saveProgress() {
        let progressValue = progressModel.lessonProgress[lesson] ?? 0.0
        print("Saving progress for \(lesson): \(progressValue)")
        db.collection("progress").document(lesson).setData([
            "progressValue": progressValue
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    func loadProgress() {
        print("Loading progress for \(lesson)")
        db.collection("progress").document(lesson).getDocument { (document, error) in
            if let document = document, document.exists {
                if let progress = document.data()?["progressValue"] as? Float {
                    print("Loaded progress for \(lesson): \(progress)")
                    progressModel.lessonProgress[lesson] = progress
                } else {
                    print("No progress value found in document for \(lesson)")
                }
            } else {
                print("Document does not exist for \(lesson)")
                if let error = error {
                    print("Error fetching document: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    MainPageProgressViewCourse(progressModel: ProgressModel(), lesson: "Lesson1")
}
