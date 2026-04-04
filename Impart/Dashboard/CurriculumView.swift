import SwiftUI

struct CurriculumView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
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
                } header: {
                    Text("Getting Started")
                        .font(.custom("Inter-Regular_Medium", size: 16))
                }
                
                Section {
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
                } header: {
                    Text("Unit 1: Variables, Operators, and Functions")
                    .font(.custom("Inter-Regular_Medium", size: 16))
                }
            }
            .font(.custom("Inter-Regular", size: 17))
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Curriculum")
        }
    }
}


#Preview {
    CurriculumView()
}
