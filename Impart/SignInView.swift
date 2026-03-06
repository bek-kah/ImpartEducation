import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                
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
