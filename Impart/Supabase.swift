import SwiftUI
import Supabase

class Supabase {
    let client: SupabaseClient = SupabaseClient(supabaseURL: URL(string: "https://dmttqbdpatbxuxsumecb.supabase.co")!, supabaseKey: "sb_publishable_o1_5CrxLlK8amj3AM1SIiA_XQpMxvcP")
    
    var currentSession: Session?
    var currentUser: Auth.User?
    
    init() {}
    
    func signUp(email: String, password: String) async -> String? {
        do {
            let response = try await client.auth.signUp(email: email, password: password)
            currentUser = response.user
            currentSession = response.session
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
            currentSession = nil
            return nil
        } catch {
            return error.localizedDescription
        }
    }
}


