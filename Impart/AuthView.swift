import SwiftUI

struct AuthView: View {
    
    enum AuthViewType {
        case logIn
        case signUp
        case confirmEmail
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var errorMessage: String? = nil
    
    @Binding var isAuthenticated: Bool
    @State private var authPageType: AuthViewType = .logIn
    
    private var supabase: Supabase
    
    init(
        isAuthenticated: Binding<Bool>,
        supabase: Supabase
    ) {
        self._isAuthenticated = isAuthenticated
        self.supabase = supabase
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                switch authPageType {
                case .logIn:
                    logInView
                case .signUp:
                    signUpView
                case .confirmEmail:
                    confirmEmailView
                }
            }
            .navigationTitle("Impart")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: supabase.currentUser) {
            isAuthenticated = true
        }
    }
}

#Preview {
    AuthView(isAuthenticated: .constant(false), supabase: Supabase())
}

extension AuthView {
    var logInView: some View {
        Group {
            Text("Welcome back")
                .font(.largeTitle)
            
            Text("Sign in to your Impart account")
            
            VStack {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .padding(.bottom)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.footnote)
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            
            Button("Sign in") {
                Task {
                    errorMessage = await supabase.logIn(email: email, password: password)
                }
            }
            .disabled(password.isEmpty || email.isEmpty)
            .buttonStyle(.borderedProminent)
            .tint(.primary)
            
            Button("Forgot your password?", action: {})
            HStack {
                Text("Don't have an account?")
                Button("Sign up", action: { authPageType = .signUp })
            }
        }
    }
}


extension AuthView {
    var signUpView: some View {
        Group {
            Text("Sign up")
                .font(.largeTitle)
            
            Text("Create your Impart account")
            
            VStack {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .padding(.bottom)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.footnote)
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            
            Button("Sign up") {
                Task {
                    errorMessage = await supabase.signUp(email: email, password: password)
                    authPageType = .confirmEmail
                }
            }
            .disabled(password.isEmpty || email.isEmpty)
            .buttonStyle(.borderedProminent)
            .tint(.primary)
            
            HStack {
                Text("Already have an account?")
                Button("Log in", action: { authPageType = .logIn })
            }
        }
    }
}


extension AuthView {
    var confirmEmailView: some View {
        Group {
            Text("Check your email for a confirmation link.")
            
            HStack {
                Text("Already confirmed?")
                Button("Log in", action: { authPageType = .logIn })
            }
        }
    }
}
