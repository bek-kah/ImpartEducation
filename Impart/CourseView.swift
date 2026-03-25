import SwiftUI

struct CourseView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text("Impart")
                        
                        VStack(alignment: .leading) {
                            Text("Impart Digital Textbook")
                                .font(.system(size: 14))
                            Text("Introduction to Computer Science")
                                .font(.system(size: 24, weight: .heavy))
                        }
                            .padding(.top, 100)
                        
                        
                        Text("Build a strong foundation in programming fundamentals, problem-solving strategies, and computational thinking. Learn core concepts through hands-on coding exercises ")
                            .padding(.vertical, 30)
                    }
                    .padding()
                    .foregroundStyle(.white)
                }
                .listRowBackground(Color.blue.opacity(0.7))
                
                
                Section() {
                    NavigationLink {
                        CurriculumView()
                    } label: {
                        HStack {
                            Image(systemName: "book")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Curriculum")
                            Spacer()
                        }
                    }
                    
                    NavigationLink {
                        AssignmentsView()
                    } label: {
                        HStack {
                            Image(systemName: "pencil.and.list.clipboard")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Assignments")
                            Spacer()
                        }
                    }
                    
                    NavigationLink {
                
                    } label: {
                        HStack {
                            Image(systemName: "medal")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Grades")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Intro to CS")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CourseView()
}
