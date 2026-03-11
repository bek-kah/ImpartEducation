import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var status: (Bool, String?) = (true, nil)
    
    private var supabase = Supabase()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Welcome back")
                    .font(.largeTitle)
                
                Text("Sign in to your Impart account")
                
                VStack {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .padding(.bottom)
                    
                    if !status.0 {
                        Text(status.1!)
                        .foregroundStyle(.red)
                        .font(.footnote)
                    }
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                
                Button("Sign in") {
                    Task {
                        status = await supabase.createUser(email: email, password: password)
                    }
                }
                
                NavigationLink {
                    HomeView()
                } label: {
                    Text("Sign in")
                }
                .disabled(password.isEmpty || email.isEmpty)
                .buttonStyle(.borderedProminent)

                .tint(.primary)
                
                Button("Forgot your password?", action: {})
                HStack {
                    Text("Don't have an account?")
                    Button("Sign up", action: {})
                }
            }
            .navigationTitle("Impart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignInView()
}




var weakPassword: Text = Text("""
                        Password should contain at least one character of each:
                        • lowercase letter
                        • uppercase letter
                        • number
                        • special character
                        """)
