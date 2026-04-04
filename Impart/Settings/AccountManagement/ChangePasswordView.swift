import SwiftUI

enum ChangePasswordState {
    case empty, weak, okay, strong, perfect, confirmed
    
    var progressValue: CGFloat {
        switch self {
        case .empty:
            0.0
        case .weak:
            0.25
        case .okay:
            0.5
        case .strong:
            0.75
        case .perfect:
            1.0
        case .confirmed:
            1.0
        }
    }
    
    var progressColor: Color {
        switch self {
        case .empty:
            .clear
        case .weak:
            .red
        case .okay, .strong:
            .purple.mix(with: .blue, by: 2/3)
        case .perfect:
            .green
        case .confirmed:
            .green
        }
    }
    
    var text: String {
        switch self {
        case .empty:
            ""
        case .weak:
            "Not enough characters"
        case .okay:
            "Add special characters and numbers"
        case .strong:
            "Add special characters or numbers"
        case .perfect:
            "Perfect!"
        case .confirmed:
            "Password changed successfully"
        }
    }
}

struct ChangePasswordView: View {
    @EnvironmentObject var supabase: SupabaseManager
    
    @State private var password: String = ""
    
    @State private var changePasswordState: ChangePasswordState = .empty
    
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.custom("Inter-Regular", size: 12))
                        .foregroundStyle(.secondary)
                    
                    TextField("Create a strong password", text: $password)
                        .textContentType(.emailAddress)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(.custom("Inter-Regular", size: 17))
                    
                    if (changePasswordState != .empty) {
                        ProgressView(value: changePasswordState.progressValue)
                            .progressViewStyle(.linear)
                            .frame(height: 8)
                            .tint(changePasswordState.progressColor)
                            .animation(.default, value: changePasswordState)
                        
                        Text(changePasswordState.text)
                            .font(.custom("Inter-Regular", size: 12))
                            .foregroundStyle(.secondary)
                    }
                    
                    Text("Use 8 or more letters, numbers, and symbols")
//                        .font(.caption)
                        .font(.custom("Inter-Regular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .listRowSeparator(.hidden)

            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Password")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: password) {
                if password.isEmpty {
                    changePasswordState = .empty
                    return
                }
                
                let hasMinLength = password.count >= 8
                let hasNumbers = password.contains(where: \.isNumber)
                let hasSpecialChars = password.contains(where: { "!@#$%^&*()_+-=[]{}|;':\",./<>?".contains($0) })
                
                if hasMinLength {
                    changePasswordState = .okay
                    if hasNumbers || hasSpecialChars {
                        changePasswordState = .strong
                    }
                    if hasNumbers && hasSpecialChars {
                        changePasswordState = .perfect
                    }
                } else {
                    changePasswordState = .weak
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { print("1")}
                        .foregroundStyle(changePasswordState == .perfect ? Color.primary : .gray)
                        .disabled(changePasswordState != .perfect)
                        .font(.custom("Inter-Regular", size: 17))
                }
            }
        }
    }
}

#Preview {
    ChangePasswordView()
}
