import SwiftUI

@main
struct ImpartApp: App {
    @StateObject private var supabase = SupabaseManager()
    
    var body: some Scene {
        WindowGroup {
            if supabase.isLoading {
                ProgressView()  // brief splash while session restores
            } else if supabase.currentUser != nil {
                HomeView()
                    .environmentObject(supabase)
            } else {
                AuthView()
                    .environmentObject(supabase)
            }
        }
    }
}
