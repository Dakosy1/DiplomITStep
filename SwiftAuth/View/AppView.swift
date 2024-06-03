import SwiftUI

struct AppView: View {
    @State var selectTab = "Profile"
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var listViewModel = ListViewModel()
    
    
    let tabs = ["Home", "Alphabet", "Flashcards", "Profile"]
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectTab){
                MainPageCourse()
                //RandomWordView()
                    .padding(.horizontal, 15 )
                    .tag("Main")
                AlphabetView()
                    .tag("Alphabet")
                ListView()
                    .environmentObject(listViewModel)
                    .padding(.horizontal, 15)
                    .tag("Flashcards")
                ProfileView()
                   .environmentObject(viewModel)
                    .tag("Profile")
            }
            
            if listViewModel.isShowAddView{
                AddNewWordView()
                    .environmentObject(listViewModel)
            }
                
            
            HStack{
                ForEach(tabs, id: \.self){ tab in
                    Spacer()
                    TabBarItem(tab: tab, selected: $selectTab)
                    Spacer()
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 5)
            .frame(maxWidth: .infinity)
            .background(Color("MainGB"))
        }
    }
}

struct TabBarItem: View {
    @State var tab: String
    @Binding var selected: String
    
    var body: some View {
        if tab == "Profile"{
            Button{
                withAnimation(.spring()){
                    selected = tab
                }
            } label: {
                ZStack{
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(selected == tab ? Color("SolidGB") : .white)
                    
                    Image("Face")
                        .resizable()
                        .frame(width: 33, height: 33)
                        .clipShape(Circle())
                }
            }
        }else{
            ZStack{
                Button{
                    withAnimation(.spring()){selected = tab}
                } label:{
                    HStack{
                        Image(tab)
                            .resizable()
                            .frame(width: 30, height: 30)
                        if selected == tab{
                            Text(tab)
                                .font(.system(size: 14))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .opacity(selected == tab ? 1 : 0.7 )
            .padding(.vertical, 5)
            .padding(.horizontal, 17)
            .background(selected == tab ? .white : Color("MainGB"))
            .clipShape(Capsule())
        }
    }
}

