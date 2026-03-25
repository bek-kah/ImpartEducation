import SwiftUI

struct HomeView: View {
    @EnvironmentObject var supabase: SupabaseManager

    var body: some View {
        ZStack {
            if supabase.isLoading {
                ProgressView()
            } else if supabase.currentUser != nil {
                TabView {
                    Tab("Dashboard", systemImage: "square.grid.2x2") {
                        DashboardView()
                    }
                    Tab("Settings", systemImage: "gear") {
                        SettingsView()
                    }
                }
                .transition(.move(edge: .trailing))
            } else {
                AuthView()
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.4), value: supabase.currentUser == nil)
    }
}
