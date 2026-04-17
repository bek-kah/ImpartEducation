import LocalAuthentication
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var supabase: SupabaseManager
    @State private var isUnlocked = false
    @AppStorage("faceID") private var faceID = false

    var body: some View {
        ZStack {
            if supabase.isLoading {
                ProgressView()
            } else if supabase.currentUser != nil {
                if faceID && !isUnlocked {
                    LockScreenView(onAuthenticate: authenticate)
                } else {
                    mainTabView
                }
            } else {
                AuthView()
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.4), value: supabase.currentUser == nil)
        .onChange(of: faceID) {
            isUnlocked = true
        }
    }

    private var mainTabView: some View {
        TabView {
            Tab("Dashboard", systemImage: "square.grid.2x2") { DashboardView() }
            Tab("To-dos", systemImage: "list.bullet.clipboard") { TodosView() }
            Tab("Settings", systemImage: "gear") { SettingsView() }
        }
        .font(.custom("Inter-Regular", size: 17))
        .transition(.move(edge: .trailing))
    }

    private func authenticate() {
        let context = LAContext()
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else { return }

        context.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Authenticate to access your account."
        ) { success, _ in
            if success { isUnlocked = true }
        }
    }
}

struct LockScreenView: View {
    let onAuthenticate: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "faceid")
                .font(.system(size: 56))
                .foregroundStyle(.secondary)

            Text("App is locked")
                .font(.title3.weight(.semibold))

            Text("Authenticate to continue")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button(action: onAuthenticate) {
                Label("Use Face ID", systemImage: "faceid")
                    .frame(maxWidth: 200)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 8)
        }
        .padding()
    }
}
