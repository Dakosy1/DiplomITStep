import SwiftUI

struct ListView: View {
    @State var searchText = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    //search
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                        TextField("Search", text: $searchText)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, -5)
                    .padding(.vertical, 20)
                    .background(Color("GRAY"))
                    .cornerRadius(10)
                    
                    //cards
                    VStack(spacing: 20) {
                        cardItem()
                        cardItem()
                        cardItem()
                        cardItem()
                        cardItem()
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .overlay(
            Button{
                listViewModel.isShowAddView.toggle()
            }label:{
                ZStack {
                    Circle()
                        .frame(width: 56, height: 56)
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
            , alignment: .bottomTrailing
        )
    }
}

struct cardItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Arb")
                    .font(.system(size: 12, weight: .black))
                    .padding(.bottom, 7)
                
                Text("Araba")
                    .font(.system(size: 18, weight: .black))
                
                Rectangle()
                    .frame(height: 4)
                    .opacity(0)
                
                Text("Car")
                    .font(.system(size: 18, weight: .light))
            }
            Divider()
            
            VStack(alignment: .leading) {
                Text("Примечание")
                    .font(.system(size: 12, weight: .black))
                    .padding(.bottom, 2)
                    .foregroundColor(Color("GRAY1"))
                Text("Lorem")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color("GRAY"))
        .cornerRadius(10)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
