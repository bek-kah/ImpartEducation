import SwiftUI


// MARK: Assigment
enum AssignmentStatus {
    case locked, open
    
    var systemImage: String {
        switch self {
        case .locked:
            return "lock"
        case .open:
            return "list.bullet.clipboard"
        }
    }
}

enum AssignmentSubmissionStatus {
    case notSubmitted, submitted, graded
    
    var text: String {
        switch self {
        case .notSubmitted:
            return "Not Submitted"
        case .submitted:
            return "Submitted"
        case .graded:
            return "Graded"
        }
    }
    
    var systemImage: String {
        switch self {
        case .notSubmitted:
            return "circle.slash"
        case .submitted, .graded:
            return "checkmark.circle"
        }
    }
    
    var foregroundStyle: AnyShapeStyle {
        switch self {
        case .notSubmitted, .submitted:
            return AnyShapeStyle(.secondary)
        case .graded:
            return AnyShapeStyle(.green)
        }
    }
}

struct Assignment {
    let id: UUID
    let name: String
    let dueDate: Date
    let grade: Double?
    let outOf: Int
    
    let description: [String]
    let hints: [String]
    
    let status: AssignmentStatus
    let submissionStatus: AssignmentSubmissionStatus
    
    init(
        id: UUID = UUID(),
        name: String, dueDate: Date,
        grade: Double?,
        outOf: Int,
        description: [String] = [],
        hints: [String] = [],
        status: AssignmentStatus,
        submissionStatus: AssignmentSubmissionStatus
    ) {
        self.id = id
        self.name = name
        self.dueDate = dueDate
        self.grade = grade
        self.outOf = outOf
        self.description = description
        self.hints = hints
        self.status = status
        self.submissionStatus = submissionStatus
    }
    
    var dueDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' hh:mm a"
        let string = formatter.string(from: dueDate)
        return "Due " + string
    }
    
    var gradeString: String {
        if let grade {
            return grade.formatted(.number.precision(.fractionLength(0...2)))
        }
        return ""
    }
    
    static func fake() -> Self {
        let calendar = Calendar.current
        let dueDayAfterNext = calendar.date(byAdding: .day, value: 2, to: Date())!
        
        let description: [String] = [
            "Toward the beginning of World 1-1 in Nintendo's Super Mario Brothers, Mario must hop over adjacent pyramids of block.",
            "In a file called mario.py, implement a program in Python that recreates that pyramid, using hashes (#) for bricks.",
            "And let's allow the user to decide just how tall the pyramids should be by first prompting them for a positive integer between, say, 1 and 8, inclusive."
        ]
        
        let hints: [String] = [
            "Think about what each row looks like: some number of spaces, then hashes, then a gap of two spaces, then more hashes.",
            "For row i (starting from 1) of a pyramid with height n, how many spaces and how many hashes do you need?",
            "Use Python's string multiplication (\" \" * count) to repeat characters easily.",
            "Use a while loop to keep prompting the user until they provide valid input."
        ]
        
        return Assignment(
            name: "Problem Set 1",
            dueDate: dueDayAfterNext,
            grade: 4,
            outOf: 10,
            description: description,
            hints: hints,
            status: .open,
            submissionStatus: .graded
        )
    }
}

struct AssignmentRowView: View {
    let assignment: Assignment
    
    var body: some View {
        NavigationLink {
            AssignmentView()
        } label: {
            HStack {
                Image(systemName: assignment.status.systemImage)
                    .foregroundStyle(.orange.mix(with: .red, by: 1/3))
                    .padding(.trailing, 5)
                VStack(alignment: .leading, spacing: 5) {
                    Text(assignment.name)
                        .font(.custom("Inter-Regular_Medium", size: 16))
                    Text(assignment.dueDateString)
                        .font(.custom("Inter-Regular", size: 14))
                        .foregroundStyle(.secondary)
                    HStack {
                        Text(assignment.submissionStatus.text)
                        Image(systemName: assignment.submissionStatus.systemImage)
                    }
                    .font(.custom("Inter-Regular", size: 14))
                    .foregroundStyle(assignment.submissionStatus.foregroundStyle)
                }
                
                Spacer()
                
                Text("\(assignment.gradeString)/\(assignment.outOf)")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.orange.mix(with: .red, by: 1/3))
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AssignmentsSection {
    let id: UUID
    let assignments: [Assignment]
    let type: AssigmentsSectionType
    
    init(id: UUID = UUID(), assignments: [Assignment], type: AssigmentsSectionType) {
        self.id = id
        self.assignments = assignments
        self.type = type
    }
    
    static func fake() -> Self {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        let dueTomorrow = calendar.date(bySettingHour: 23, minute: 59, second: 0, of: tomorrow)!
        
        let upcomingAssignment1 = Assignment(
            name: "Submission Practice",
            dueDate: dueTomorrow,
            grade: nil,
            outOf: 10,
            status: .locked,
            submissionStatus: .notSubmitted
        )
        
        let dueDayAfterNext = calendar.date(byAdding: .day, value: 2, to: Date())!
        
        let upcomingAssignment2 = Assignment(
            name: "Problem Set 1",
            dueDate: dueDayAfterNext,
            grade: 4,
            outOf: 10,
            status: .open,
            submissionStatus: .graded
        )
        
        return AssignmentsSection(assignments: [upcomingAssignment1, upcomingAssignment2], type: .upcoming)
    }
}


// MARK: Assigments Section
enum AssigmentsSectionType {
    case upcoming, past
    
    var text: String {
        switch self {
        case .upcoming:
            return "Upcoming Assignments"
        case .past:
            return "Past Assignments"
        }
    }
}

struct AssignmentsSectionView: View {
    
    @Binding var showAssignmentsSection: Bool
    
    let assignmentsSection: AssignmentsSection
    
    var body: some View {
        Section {
            if showAssignmentsSection {
                ForEach(assignmentsSection.assignments, id: \.id) { assignment in
                    AssignmentRowView(assignment: assignment)
                }
            }
        } header: {
            HStack {
                Text(assignmentsSection.type.text)
                    .font(.custom("Inter-Regular_Medium", size: 16))
                Spacer()
                Button {
                    withAnimation {
                        showAssignmentsSection.toggle()
                    }
                } label: {
                    Image(systemName: showAssignmentsSection ? "chevron.up" : "chevron.down")
                }
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    GradesView()
}
