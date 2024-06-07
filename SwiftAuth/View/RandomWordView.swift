import SwiftUI

struct RandomWordView: View {
    @State var isShowTranslate = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack(spacing: 23){
                    VStack(alignment: .leading){
                        Text("TR")
                            .font(.system(size: 12, weight: .black))
                            .padding(.bottom, 0)
                        Text("Araba")
                            .font(.system(size: 36, weight: .black))
                    }

                    ZStack{
                        Text("Car")
                            .font(.system(size: 40, weight: .thin))
                            .opacity(isShowTranslate ? 1 : 0)
                        Button {
                            withAnimation {
                                isShowTranslate.toggle()
                            }
                        } label: {
                            Text("Show translate")
                            .padding()
                            .background(isShowTranslate ? Color.clear : Color("MAIN")) // Change background based on state
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                        }
                        .disabled(isShowTranslate)
                    }
                }
                Spacer()
                Button{
                    // Action for Next button
                } label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white) // Ensure the icon color is visible
                    }
                    .padding()
                    .background(Color("MAIN"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
                Rectangle()
                    .frame(height: 28)
                    .opacity(0)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    RandomWordView()
}
