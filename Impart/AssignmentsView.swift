import SwiftUI

struct AssignmentsView: View {
    
    @State private var showUpcomingAssignments: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if showUpcomingAssignments {
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundStyle(.orange)
                                    .padding(.trailing, 5)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Submission Practice")
                                        .font(.system(size: 16, weight: .medium))
                                    Text("Due Apr 1, 2026 at 11:59 PM")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.secondary)
                                    HStack {
                                        Text("Not Submitted")
                                        Image(systemName: "circle.slash")
                                    }
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("-/10")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundStyle(.orange)
                                    .padding(.trailing, 8)
                            }
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet.clipboard")
                                    .foregroundStyle(.orange)
                                    .padding(.trailing, 5)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Problem Set")
                                        .font(.system(size: 16, weight: .medium))
                                    Text("Due Apr 3, 2026 at 11:59 PM")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.secondary)
                                    HStack {
                                        Text("Graded")
                                        Image(systemName: "checkmark.circle")
                                    }
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.green)
                                }
                                
                                Spacer()
                                
                                Text("4/5")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundStyle(.orange)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text("Upcoming Assignments")
                        Spacer()
                        Button {
                            withAnimation {
                                showUpcomingAssignments.toggle()
                            }
                        } label: {
                            Image(systemName: showUpcomingAssignments ? "chevron.up" : "chevron.down")
                        }
                        .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    AssignmentsView()
}
