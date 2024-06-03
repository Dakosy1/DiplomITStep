import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                AppView ()
            } else {
                LoginView()
            }
        }
        .onAppear {
            if viewModel.userSession == nil {
                viewModel.userSession = Auth.auth().currentUser
                Task {
                    await viewModel.fetchUser()
                }
            }
        }
    }
}


