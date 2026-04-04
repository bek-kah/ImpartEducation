import SwiftUI
internal import Auth

enum ChangeEmailState {
    case confirmed, unconfirmed
    
    var badgeTextColor: Color {
        switch self {
        case .confirmed:
            return .green
        case .unconfirmed:
            return .orange
        }
    }
    
    var badgeBackgroundColor: Color {
        switch self {
        case .confirmed:
            return .green.opacity(0.1)
        case .unconfirmed:
            return .orange.opacity(0.1)
        }
    }
    
    var text: String {
        switch self {
        case .confirmed:
            return "Confirmed"
        case .unconfirmed:
            return "Uncomfirmed"
        }
    }
}

struct ChangeEmailView: View {
    @EnvironmentObject var supabase: SupabaseManager
    
    @State private var email: String = "bek.kahramonov@outlook.com"
    
    @State private var changeEmailState: ChangeEmailState = .confirmed
    
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Email")
                            .font(.custom("Inter-Regular_Light", size: 12))
                            .foregroundStyle(.secondary)
                        
                        TextField("Email", text: $email)
                            .textContentType(.emailAddress)
                            .padding()
                            .frame(height: 50)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .font(.custom("Inter-Regular", size: 16))
                    }
                    
                    HStack {
                        Image(systemName: "exclamationmark.shield.fill")
                        Text(changeEmailState.text)
                    }
                    .foregroundStyle(changeEmailState.badgeTextColor)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(changeEmailState.badgeBackgroundColor)
                    )
                    .font(.custom("Inter-Regular", size: 17))
                        
                    
                    Button {
                        
                    } label: {
                        Text("Confirm email")
                            .frame(maxWidth: .infinity)
                            .font(.custom("Inter-Regular", size: 17))
                    }
                    .disabled(changeEmailState == .confirmed)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Email")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: email) {
            if email != "bek.kahramonov@outlook.com" {
                self.changeEmailState = .unconfirmed
            } else {
                self.changeEmailState = .confirmed
            }
        }
        .onAppear {
//            email = supabase.currentUser?.email ?? ""
        }
    }
}

#Preview {
    ChangeEmailView()
}
