import SwiftUI

struct AssignmentsView: View {
    
    @State private var showUpcomingAssignments: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                AssignmentsSectionView(
                    showAssignmentsSection: $showUpcomingAssignments,
                    assignmentsSection: .fake()
                )
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    AssignmentsSectionView(showAssignmentsSection: .constant(true), assignmentsSection: .fake())
}
