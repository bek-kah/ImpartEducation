import SwiftUI

struct SecurityView: View {
    @State var twoFactor: Bool = false
    @State var faceID: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Two-factor authentication")
                            Text("This makes your account more secure. In addition to your password you'll be asked for a code we text to your phone eac time you log in.")
                                .foregroundStyle(.secondary)
                                .font(.custom("Inter-Regular", size: 14))
                        }
                        Spacer()
                        Toggle("", isOn: $twoFactor)
                            .frame(maxWidth: 75)
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Face ID")
                            Text("This makes logging quicker and more secure. It's handled entirely by your device and we don't store it.")
                                .foregroundStyle(.secondary)
                                .font(.custom("Inter-Regular", size: 14))
                        }
                        Spacer()
                        Toggle("", isOn: $faceID)
                            .frame(maxWidth: 75)
                    }
                } header: {
                    Text("Additional security measures to keep your account safe.")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
                
                
            }
            .listStyle(.plain)
            .font(.custom("Inter-Regular", size: 17))
            .scrollContentBackground(.hidden)
            .navigationTitle("Security")
        }
    }
}

#Preview {
    SecurityView()
}
