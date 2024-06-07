import SwiftUI

struct AlphabetLearnerButtonView: View {
    @State private var randomLetter: ArabicLetter = arabicAlphabet.randomElement() ?? arabicAlphabet.first!
    @State private var answerOptions: [String] = []
    @State private var score: Int = 0 
    @State private var timeRemaining: Int = 10
    @State private var timer: Timer? = nil
    @State private var lvl: Int = 0

    init() {
        _randomLetter = State(initialValue: arabicAlphabet.randomElement() ?? arabicAlphabet.first!)
        setupAnswerOptions()
    }

    func transcriptionButton(_ transcription: String) -> some View {
        Button(action: {
            if transcription == randomLetter.transcription {
                print("Correct! \(transcription) is the right transcription.")
                score += 1
            } else {
                print("Wrong! \(transcription) is not the right transcription.")
                if score > 0{
                    score -= 1
                }
            }
            // Reset the timer and refresh the letter and options
            resetQuiz()
        }) {
            Text(transcription)
                .font(.system(size: 24, weight: .bold)) // Customize the size to 24 and make it bold
                .frame(width: 180, height: 100)
                .background(Color.blue) // Changed to a standard color for testing
                .foregroundColor(.white)
                .cornerRadius(15)
        }
    }

    var body: some View {
        VStack {
            Text("Let's check your knowledge!")
            Spacer()
            
            // Display the remaining time
            Text("Time remaining: \(timeRemaining) seconds")
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            Text("Current Score: \(score)") // Display current score
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            Text(randomLetter.letter) // Display the letter from the model
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            // Place buttons in two horizontal stacks
            VStack(alignment: .center) {
                HStack {
                    if answerOptions.count >= 2 {
                        transcriptionButton(answerOptions[0])
                        transcriptionButton(answerOptions[1])
                    }
                }
                
                HStack {
                    if answerOptions.count >= 4 {
                        transcriptionButton(answerOptions[2])
                        transcriptionButton(answerOptions[3])
                    }
                }
            }
            

            
            Spacer()
        }
        .padding()
        .onAppear {
            setupAnswerOptions()
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    // Function to setup answer options
    private func setupAnswerOptions() {
        var transcriptions = arabicAlphabet.map { $0.transcription }
        transcriptions.removeAll { $0 == randomLetter.transcription }
        transcriptions.shuffle()
        answerOptions = Array(transcriptions.prefix(3))
        answerOptions.append(randomLetter.transcription)
        answerOptions.shuffle()
        print("Answer options: \(answerOptions)") // Debug statement to check options
    }
    
    // Function to start the timer
    private func startTimer() {
        timer?.invalidate() // Invalidate any existing timer
        timeRemaining = 10 // Reset the time
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                if score > 0{
                    score -= 1 // Decrement the score when time is up
                }
                resetQuiz() // Reset the quiz
            }
        }
    }
    
    // Function to reset the quiz
    private func resetQuiz() {
        randomLetter = arabicAlphabet.randomElement() ?? arabicAlphabet.first!
        setupAnswerOptions()
        startTimer() // Restart the timer
    }
}

struct AlphabetLearnerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetLearnerButtonView()
    }
}
