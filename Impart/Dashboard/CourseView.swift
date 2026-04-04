import SwiftUI

struct CourseView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text("Impart")
                            .font(.custom("Lora", size: 16))
                        
                        VStack(alignment: .leading) {
                            Text("Impart Digital Textbook")
                                .font(.custom("Inter-Regular", size: 14))
                            Text("Introduction to Computer Science")
//                                .font(.system(size: 24, weight: .heavy))
                                .font(.custom("Inter-Regular_Black", size: 24))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                            .padding(.top, 100)
                        
                        
                        Text("Build a strong foundation in programming fundamentals, problem-solving strategies, and computational thinking. Learn core concepts through hands-on coding exercises ")
                            .font(.custom("Inter-Regular", size: 16))
                            .padding(.top, 30)
//
                    }
                    .padding(25)
                    .foregroundStyle(.white)
                    .background(
                        .blue.gradient,
                        in: RoundedRectangle(cornerRadius: 25))
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
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
                        GradesView()
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
            .font(.custom("Inter-Regular", size: 17))
            .listStyle(.plain)
            .navigationTitle("CS101")
            .navigationBarTitleDisplayMode(.inline)
            .defaultScrollAnchor(.top)
        }
    }
}

#Preview {
    CourseView()
}
