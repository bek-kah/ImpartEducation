import SwiftUI
internal import Auth

struct SettingsView: View {
    
    @State private var email: String = "bek.kahramonov@outlook.com"
    @State private var password: String = ""
    
    @EnvironmentObject var supabase: SupabaseManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("Manage your account settings") {
                    VStack(alignment: .leading) {
                        Text("Email Address")
                            .bold()
                        
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Update Email", action: {})
                            .padding(.top)
                            .foregroundStyle(.primary)
                            .buttonStyle(.bordered)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.clear)
                    )
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Password")
                            .bold()
                        
                        Text("Reset your password using our secure password recovery flow.")
                        
                        Button("Reset Password", action: {})
                            .padding(.top)
                            .foregroundStyle(.primary)
                            .buttonStyle(.bordered)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.clear)
                    )
                }
                
                Section {
                    Button("Sign Out", role: .destructive, action: signOut)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowBackground(Color.clear)
                    
                }
                
            }
            .background(Color(.secondarySystemBackground))
            .navigationTitle("Settings")
            .onAppear {
                email = supabase.currentUser?.email ?? ""
            }
        }
    }
    
    func signOut() {
        Task {
            if let errorMessage = await supabase.signOut() {
                print(errorMessage)
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SupabaseManager())
}
