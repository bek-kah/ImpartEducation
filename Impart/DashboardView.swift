import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Image(systemName: "graduationcap")
                                .font(.system(size: 20))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.blue.opacity(0.1))
                                )
                                .foregroundStyle(.blue)
                                .padding(.vertical)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("CORE CS")
                                .font(.system(size: 10, weight: .black))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.blue.opacity(0.1))
                                )
                                .foregroundStyle(.blue)

                            Text("CORE CS")
                                .font(.system(size: 10, weight: .black))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(.blue.opacity(0.1))
                                )
                                .foregroundStyle(.blue)
                                .hidden()
                        }
                    }
                    
                    Text("Introduction to Computer Science")
                        .padding(.bottom)
                        .font(.title)
                        .bold()

                    
                    Text("Build a strong foundation in programming fundamentals, problem-solving strategies, and computational thinking. Learn core concepts through hands-on coding exercise and real-world applications.")
                        .padding(.bottom, 50)
                    
                    NavigationLink {
                        CourseView()
                    } label: {
                        Text("View Syllabus")
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DashboardView()
}
