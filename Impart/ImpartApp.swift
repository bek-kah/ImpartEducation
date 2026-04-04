import SwiftUI

@main
struct ImpartApp: App {
    @StateObject private var supabase = SupabaseManager()
    
    init() {
        applyGlobalFonts()
    }
    
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

func applyGlobalFonts() {
    let largeAttr: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Lora", size: 34)!
    ]
    let inlineAttr: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Lora", size: 17)!
    ]
    UINavigationBar.appearance().largeTitleTextAttributes = largeAttr
    UINavigationBar.appearance().titleTextAttributes = inlineAttr
}
