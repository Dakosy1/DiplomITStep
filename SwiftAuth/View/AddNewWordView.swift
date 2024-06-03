import SwiftUI

struct AddNewWordView: View {
    
    @State var newWord = ""
    @State var wordTranslate = ""
    @State var wordDescription = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("New word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }

            }
            
            VStack(alignment: .leading){
                Text("TR")
                    .font(.system(size: 12, weight: .black))
                
                HStack{
                    TextField("Word", text: $newWord)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("GRAY"))
                .cornerRadius(10)
                
                HStack{
                    TextField("Translate", text: $wordTranslate)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("GRAY"))
                .cornerRadius(10)
                
                Text("Description")
                    .font(.system(size: 14, weight: .black))
                    .padding(.top, 23)
                    .padding(.leading, 3)
                HStack{
                    Rectangle()
                        .opacity(0)
                        .frame(height: 90)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("GRAY"))
                .cornerRadius(10)
            }
            
            Spacer()
            Button{
                listViewModel.isShowAddView.toggle()
            } label: {
                Text("Save")
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color("MAIN"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
//        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(Color(.white))
    }
}

#Preview {
    AddNewWordView()
}
