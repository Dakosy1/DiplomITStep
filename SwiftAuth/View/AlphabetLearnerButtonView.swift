import SwiftUI

struct AlphabetLearnerButtonView: View {
    @State var transcription = ""
    
    var body: some View {
        Text("Let's check your knowledge!")
        
        Text("Character")
        Spacer()
        
        VStack(alignment: .center){
            HStack{
                Text("Transcription1")
                
                Text("Transcription2")
            }
            
            HStack{
                Text("Transcription3")
                
                Text("Transcription4")
            }
        }
    }
    
    func blocksWithTranscriptions(){
        Text(transcription)
    }
}

#Preview {
    AlphabetLearnerButtonView()
}
