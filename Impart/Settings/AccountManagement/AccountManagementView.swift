import SwiftUI

struct AccountManagementView: View {
    @EnvironmentObject var supabase: SupabaseManager
    
    @State private var email: String = "bek.kahramonov@outlook.com"
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("Personal information") { PersonalInformationView() }
                    NavigationLink {
                        ChangeEmailView()
                    } label: {
                        HStack {
                            Text("Email")
                            Spacer()
                            Text(email)
                                .font(.custom("Inter-Regular_Light", size: 14))
                                .foregroundStyle(.secondary)
                        }
                    }
                    NavigationLink {
                        ChangePasswordView()
                    } label: {
                        HStack {
                            Text("Password")
                            Spacer()
                            Text("Change password")
                                .font(.custom("Inter-Regular_Light", size: 14))
                                .foregroundStyle(.secondary)
                        }
                    }
                } header: {
                    Text("Make changes to your personal information and account configurations.")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
            }
            .font(.custom("Inter-Regular", size: 17))
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Account management")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
//            email = supabase.currentUser?.email ?? ""
        }
    }
}

#Preview {
    AccountManagementView()
}
