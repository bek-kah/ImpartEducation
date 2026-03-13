import SwiftUI


struct HomeView: View {
    @State private var isAuthenticated: Bool = false
    private var supabase = Supabase()
    
    var body: some View {
        ZStack {
            if isAuthenticated {
                TabView {
                    Tab("Dashboard", systemImage: "square.grid.2x2") {
                        DashboardView()
                    }
                    Tab("Settings", systemImage: "gear") {
                        SettingsView(supabase: supabase)
                    }
                }
                .transition(.move(edge: .trailing))
            } else {
                AuthView(
                    isAuthenticated: $isAuthenticated,
                    supabase: supabase
                )
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.4), value: isAuthenticated)
    }
}
