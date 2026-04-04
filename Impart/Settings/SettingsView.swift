import SwiftUI
internal import Auth

struct SettingsView: View {
    @EnvironmentObject var supabase: SupabaseManager
    
    init() {
        for family in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: family) {
                print(fontName)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("Account management") { AccountManagementView() }
                    NavigationLink("Notifications") { NotificationsView() }
                    NavigationLink("Security") { SecurityView() }
                } header: {
                    Text("Settings")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
            
                
                Section {
                    Link(destination: URL(string:"https://discord.gg/MWswxqFTTK")!) {
                        HStack {
                            Text("Help center")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .foregroundStyle(.tertiary)
                        }
                    }
                    Link(destination: URL(string: "https://www.imparteducation.com/terms-and-conditions")!) {
                        HStack {
                            Text("Terms of service")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .foregroundStyle(.tertiary)
                        }
                    }
                    Link(destination: URL(string: "https://www.imparteducation.com/privacy-policy")!) {
                        HStack {
                            Text("Privacy policy")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .foregroundStyle(.tertiary)
                        }
                    }
                } header: {
                    Text("Support")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
                
                
                HStack(alignment: .center) {
                    Button("Log out", action: signOut)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.red)
                }
                .listRowSeparator(.hidden)
                .padding(.top)
            }
            .font(.custom("Inter-Regular", size: 17))
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Your account")
            .navigationBarTitleDisplayMode(.inline)
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
