import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var confirmationFromUser = false
    
    var body: some View {
        NavigationView {
            if let user = viewModel.currentUser {
                List {
                    Section {
                        HStack {
                            Image("Face")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.firstName + " " + user.lastName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                                    .accentColor(.gray)
                            }
                        }
                    }
                    
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
//                    Section("Chapter1") {
//                        NavigationLink(destination: Chapter1()) {
//                            Text("Go to Chapter 1")
//                                .foregroundColor(.primary)
//                                .padding()
//                                .background(Color(.systemBackground))
//                                .cornerRadius(10)
//                        }
//                    }

                    
                    Section("Account") {
                        Button(role: .destructive, action: {
                            confirmationFromUser = true
                        }, label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
                        })
                        .confirmationDialog("Sign Out", isPresented: $confirmationFromUser) {
                            Button("Yes") {
                                withAnimation {
                                    viewModel.signOut()
                                }
                            }
                            Button("No", role: .cancel) {}
                        } message: {
                            Text("Are you sure you want to sign out?")
                        }
                        
                        Button(role: .destructive, action: {
                            confirmationFromUser = true
                        }, label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.red))
                        })
                        .confirmationDialog("Are you sure?", isPresented: $confirmationFromUser) {
                            Button("Yes") {
                                withAnimation {
                                    viewModel.deleteAccount()
                                }
                            }
                        } message: {
                            Text("Are you sure you want to delete account?")
                        }
                    }
                }
            } else {
                Text("Loading...")
                    .onAppear {
                        Task {
                            await viewModel.fetchUser()
                        }
                    }
            }
        }
    }
}

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
