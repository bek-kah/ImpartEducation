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
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Grades")
        }
    }
}

// MARK: Stat Capsule View
struct StatCapsuleView: View {
    let label: String
    let imageName: String
    let primary: String
    let secondary: String?

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: imageName)
                    .foregroundStyle(.white.opacity(2/3))
                Text(label)
                    .font(.custom("Inter-Regular_Medium", size: 17))
                    .foregroundStyle(.white.opacity(2/3))
            }

            Spacer()

            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text(primary)
                    .font(.custom("Inter-Regular_Medium", size: 24))
                    .foregroundStyle(.white)

                if let secondary {
                    Text("\(secondary)")
                        .font(.custom("Inter-Regular_Medium", size: 15))
                        .foregroundStyle(.white.opacity(2/3))
                }
            }
        }
        .padding(15)
        .background(
            .orange.mix(with: .red, by: 1/3).gradient,
            in: RoundedRectangle(cornerRadius: 20))
    }
}


#Preview {
    GradesView()
}
