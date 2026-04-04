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
    
    @State private var authPageType: AuthViewType = .logIn
    
    @EnvironmentObject var supabase: SupabaseManager

    
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
    }
}

extension AuthView {
    var logInView: some View {
        Group {
            Text("Welcome back")
                .font(.custom("Inter-Regular", size: 30))
            
            Text("Sign in to your Impart account")
            
            VStack {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom)
                    .onSubmit { performLogin() }
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.footnote)
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            
            Button("Sign in", action: performLogin)
            .disabled(password.isEmpty || email.isEmpty)
            .buttonStyle(.borderedProminent)
            
            Button("Forgot your password?", action: {})
            HStack {
                Text("Don't have an account?")
                Button("Sign up", action: { authPageType = .signUp })
            }
        }
        .font(.custom("Inter-Regular", size: 17))
    }
    
    func performLogin() {
        guard !password.isEmpty && !email.isEmpty else { return }
        Task {
            if let errorMessage = await supabase.logIn(email: email, password: password) {
                print(errorMessage)
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
//                    authPageType = .confirmEmail
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



#Preview {
    AuthView()
}
