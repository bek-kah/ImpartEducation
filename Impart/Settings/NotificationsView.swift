import SwiftUI

struct NotificationsView: View {
    @State private var announcement = false
    @State private var dueDate = false
    @State private var grading = false
    @State private var submissionComment = false
    @State private var notificationsEnabled = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle("Announcement", isOn: $announcement)
                    Toggle("Due date", isOn: $dueDate)
                    Toggle("Grading", isOn: $grading)
                    Toggle("Submission comment", isOn: $submissionComment)
                } header: {
                    if !notificationsEnabled {
                        Text(footerText)
                            .font(.custom("Inter-Regular_Medium", size: 16))
                    }
                    Text("Toggle push notifications to personalize your experience.")
                        .font(.custom("Inter-Regular_Medium", size: 16))
                }
                .font(.custom("Inter-Regular", size: 17))
                .disabled(!notificationsEnabled)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Notifications")
        }
        .task {
            await requestNotificationPermission()
            await checkNotificationStatus()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            Task { await checkNotificationStatus() }
        }
    }
    
    private func checkNotificationStatus() async {
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        await MainActor.run {
            notificationsEnabled = settings.authorizationStatus == .authorized
        }
    }
    
    private func requestNotificationPermission() async {
        let center = UNUserNotificationCenter.current()
        let settings = await center.notificationSettings()
        
        // Only request if not yet determined — won't re-prompt if denied
        guard settings.authorizationStatus == .notDetermined else { return }
        
        try? await center.requestAuthorization(options: [.alert, .badge, .sound])
    }
    
    private var footerText: AttributedString {
        let text = AttributedString("Turn on notifications in Settings to toggle the selections above. ")
        var link = AttributedString("Open Settings.")
        link.link = URL(string: UIApplication.openNotificationSettingsURLString)
        link.foregroundColor = .accentColor
        return text + link
    }
}

#Preview {
    NotificationsView()
}
