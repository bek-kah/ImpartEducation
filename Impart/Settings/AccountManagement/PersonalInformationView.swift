import SwiftUI

struct PersonalInformationView: View {
    @State private var pronouns: String = "he/him"
    @State private var language: String = "English (US)"
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("Pronouns")
                            Spacer()
                            Text(pronouns)
                                .font(.custom("Inter-Regular_Light", size: 14))
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("Language")
                            Spacer()
                            Text(language)
                                .font(.custom("Inter-Regular_Light", size: 14))
                                .foregroundStyle(.secondary)
                        }
                    }
                } header: {
                    Text("Edit your personal info that shows up for others.")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Personal information")
        }
    }
}
