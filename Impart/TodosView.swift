import SwiftUI
import Combine

struct TodosView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(ToDo.fake(), id:\.id) { todo in
                    TodoView(todo: todo)
                }
            }
            .navigationTitle("Impart")
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TodoView: View {
    
    @ObservedObject var todo: ToDo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(todo.course)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.blue)
                Text(todo.title)
                    .font(.system(size: 16, weight: .medium))
                Text("Due " + todo.dueDate.formatted())
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                todo.isComplete.toggle()
            } label: {
                Image(systemName: todo.isComplete ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .buttonStyle(.plain)
            .foregroundStyle(.orange)
        }
    }
}

class ToDo: ObservableObject, Identifiable {
    let id: UUID = UUID()
    let course: String
    let title: String
    let dueDate: Date
    
    @Published var isComplete: Bool
    
    init(course: String, title: String, dueDate: Date, isComplete: Bool = false) {
        self.course = course
        self.title = title
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
    
    static func fake() -> [ToDo] {
        var toDos: [ToDo] = []
        for assignment in AssignmentsSection.fake().assignments {
            if assignment.submissionStatus == .notSubmitted {
                let toDo = ToDo(course: "Intro to Computer Science", title: assignment.name, dueDate: assignment.dueDate)
                toDos.append(toDo)
            }
        }
        return toDos
    }
}

#Preview {
    TodosView()
}
