import SwiftUI
internal import Auth

struct SettingsView: View {
    
    @State private var email: String = "bek.kahramonov@outlook.com"
    @State private var password: String = ""
    
    private var supabase: Supabase
    
    init(supabase: Supabase) {
        self.supabase = supabase
        self._email = State(initialValue: supabase.currentUser?.email ?? "")
    }
    
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
                                .fill(.white)
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
                                .fill(.white)
                        )
                    }
                    
                    Section {
                        Button("Sign Out", role: .destructive, action: {})
                            .frame(maxWidth: .infinity, alignment: .center)
                            .listRowBackground(Color.clear)

                    }
                
            }
            .background(Color(.secondarySystemBackground))
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(supabase: Supabase())
}
