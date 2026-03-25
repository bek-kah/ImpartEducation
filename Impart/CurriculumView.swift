import SwiftUI

struct CurriculumView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Getting Started") {
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "play.circle")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Course Information")
                            Spacer()
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "play.circle")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Setting up your Development Information")
                            Spacer()
                        }
                    }
                }
                
                Section("Unit 1: Variables, Operators, and Functions") {
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "play.circle")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Python")
                            Spacer()
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "play.circle")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Functions, Variables, and Operators")
                            Spacer()
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "play.circle")
                                .foregroundStyle(Color.blue.opacity(0.7))
                                .padding(.trailing, 5)
                            Text("Typing, Comments, and More")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    CurriculumView()
}
