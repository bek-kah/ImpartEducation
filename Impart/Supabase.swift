import SwiftUI
import Combine
import Supabase

class SupabaseManager: ObservableObject {
    let client: SupabaseClient = SupabaseClient(
        supabaseURL: URL(string: "https://dmttqbdpatbxuxsumecb.supabase.co")!,
        supabaseKey: "sb_publishable_o1_5CrxLlK8amj3AM1SIiA_XQpMxvcP"
    )
    
    @Published var currentUser: User?
    @Published var isLoading = true  // prevents flash of login screen

    init() {
        Task {
            await restoreSession()
        }
    }

    // ✅ Call this on app launch to restore persisted session
    func restoreSession() async {
        do {
            let session = try await client.auth.session
            await MainActor.run {
                currentUser = session.user
                isLoading = false
            }
        } catch {
            await MainActor.run {
                currentUser = nil
                isLoading = false
            }
        }
    }
    
    func signUp(email: String, password: String) async -> String? {
        do {
            let response = try await client.auth.signUp(email: email, password: password)
            currentUser = response.user
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    
    func logIn(email: String, password: String) async -> String? {
        do {
            let response = try await client.auth.signIn(email: email, password: password)
            currentUser = response.user
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    func signOut() async -> String? {
        do {
            try await client.auth.signOut()
            currentUser = nil
            return nil
        } catch {
            return error.localizedDescription
        }
    }
}


