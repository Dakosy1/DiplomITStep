import SwiftUI
import Firebase
import FirebaseFirestore

struct MainPageCourse: View {
    @StateObject var progressModel = ProgressModel()

    var body: some View {
        NavigationStack {
            Form {
                Section("Chapter 1") {
                    NavigationLink(destination: Chapter1()) {
                        ButtonView1(label: "Lesson 1", progress: Binding(
                            get: { progressModel.lessonProgress["Lesson1"] ?? 0.0 },
                            set: { progressModel.lessonProgress["Lesson1"] = $0 }
                        ))
                    }
                }
                
                Section("Chapter 2") {
                    NavigationLink(destination: MainPageProgressViewCourse(progressModel: progressModel, lesson: "Lesson2")) {
                        ButtonView1(label: "Lesson 2", progress: Binding(
                            get: { progressModel.lessonProgress["Lesson2"] ?? 0.0 },
                            set: { progressModel.lessonProgress["Lesson2"] = $0 }
                        ))
                    }
                    NavigationLink(destination: MainPageProgressViewCourse(progressModel: progressModel, lesson: "Lesson3")) {
                        ButtonView1(label: "Lesson 3", progress: Binding(
                            get: { progressModel.lessonProgress["Lesson3"] ?? 0.0 },
                            set: { progressModel.lessonProgress["Lesson3"] = $0 }
                        ))
                    }
                    NavigationLink(destination: MainPageProgressViewCourse(progressModel: progressModel, lesson: "Lesson4")) {
                        ButtonView1(label: "Lesson 4", progress: Binding(
                            get: { progressModel.lessonProgress["Lesson4"] ?? 0.0 },
                            set: { progressModel.lessonProgress["Lesson4"] = $0 }
                        ))
                    }
                }
            }
            .navigationTitle("Main Course")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                loadProgress()
            }
        }
    }

    func loadProgress() {
        let db = Firestore.firestore()
        let lessons = ["Lesson1", "Lesson2", "Lesson3", "Lesson4"]
        for lesson in lessons {
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
}

#Preview {
    MainPageCourse()
}
