import SwiftUI

struct NotificationsView: View {
    @State var announcement: Bool = false
    @State var dueDate: Bool = false
    @State var grading: Bool = false
    @State var submissionComment: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle("Announcement", isOn: $announcement)
                    Toggle("Due date", isOn: $dueDate)
                    Toggle("Grading", isOn: $grading)
                    Toggle("Submission comment", isOn: $submissionComment)
                } header: {
                    Text("Toggle push notifications to personalize your experience.")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
                .font(.custom("Inter-Regular", size: 17))
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationsView()
}
