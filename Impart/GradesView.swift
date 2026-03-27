import SwiftUI

struct GradesView: View {
    
    @State private var showUpcomingAssignments: Bool = true
    
    private var assignmentsSection: AssignmentsSection = .fake()
    
    var assignmentsCompletedString: String {
        "\(assignmentsSection.assignments.filter { $0.submissionStatus != .notSubmitted }.count)"
    }
    
    var assignmentsOutOfString: String {
        "\(assignmentsSection.assignments.count)"
    }
    
    var totalGradeString: String {
        var grade: Double = 0
        var count: Int = 0

        for assignment in assignmentsSection.assignments {
            if assignment.submissionStatus == .graded,
               let assignmentGrade = assignment.grade {
                grade += assignmentGrade / Double(assignment.outOf) * 100
                count += 1
            }
        }

        guard count > 0 else { return "--" }
        return "\((grade / Double(count)).rounded())"
    }
    
    var body: some View {
        NavigationStack {
            Section {
                HStack {
                    StatCapsuleView(
                        label: "Assignments",
                        imageName: "list.bullet.clipboard",
                        primary: assignmentsCompletedString,
                        secondary: "/\(assignmentsOutOfString)"
                    )
                    StatCapsuleView(
                        label: "Grade",
                        imageName: "chart.bar.fill",
                        primary: totalGradeString,
                        secondary: "%")
                }
                .padding(.horizontal)
            }
            
            List {
                AssignmentsSectionView(showAssignmentsSection: $showUpcomingAssignments, assignmentsSection: .fake())
            }
            .scrollContentBackground(.hidden)
        }
    }
}


#Preview {
    GradesView()
}
