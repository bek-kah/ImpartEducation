import SwiftUI

struct AssignmentView: View {
    let assignment: Assignment = .fake()
    
    @State private var isShowingSubmission: Bool = true
    @State private var isShowingDescription: Bool = true
    @State private var isShowingHints: Bool = true
    
    @State private var grade: Double = 0
    
    init() {
        _grade = State(initialValue: (assignment.grade ?? 1) / Double(assignment.outOf))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Section {
                        if isShowingSubmission {
                            HStack(spacing: 7) {
                                Text("Graded")
                                    .font(.custom("Lora-Regular_Medium", size: 16))
                                    .foregroundStyle(.secondary)
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                                
                                Spacer()
                                
                                Text("\(assignment.gradeString)/\(assignment.outOf)")
                                    .font(.custom("Lora-Regular_Medium", size: 16))
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.horizontal)
                            
                            ProgressView(value: grade)
                                .tint(.green)
                                .progressViewStyle(.linear)
                                .padding(10)
                            
                            
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    Text("Rubric & Feedback")
                                        .font(.custom("Lora-Regular_Medium", size: 16))
                                    Image(systemName: "chevron.right")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(UIColor.secondarySystemBackground))
                                )
                            }
                            .foregroundStyle(.secondary)
                            .padding()
                        }
                        
                    } header: {
                        HStack {
                            Text("Submission")
                                .font(.custom("Lora-Regular_Medium", size: 17))
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    isShowingSubmission.toggle()
                                }
                            } label: {
                                Image(systemName: isShowingSubmission ? "chevron.up" : "chevron.down")
                                    .foregroundStyle(Color(.secondaryLabel))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    
                    Section {
                        if isShowingDescription {
                            ForEach(assignment.description, id:\.self) { text in
                                Text(text)
                                    .font(.custom("Inter-Regular_Light", size: 14))
                                    .padding(.horizontal)
                            }
                        }
                    } header: {
                        HStack {
                            Text("Problem to solve")
                                .font(.custom("Lora-Regular_Medium", size: 17))
                            Spacer()
                            Button {
                                withAnimation {
                                    isShowingDescription.toggle()
                                }
                            } label: {
                                Image(systemName: isShowingDescription ? "chevron.up" : "chevron.down")
                                    .foregroundStyle(Color(.secondaryLabel))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Section {
                        if isShowingHints {
                            VStack(alignment: .leading) {
                                ForEach(assignment.hints.enumerated(), id:\.offset) { index, text in
                                    HStack(spacing: 10) {
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .foregroundStyle(.secondary)
                                        Text(text)
                                            .font(.custom("Inter-Regular_Light", size: 13))
                                    }
                                    .padding()
                                    
                                    if index < assignment.hints.count - 1 {
                                        Divider()
                                            .padding(.leading, 50)
                                    }
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(UIColor.secondarySystemBackground))
                            )
                            .padding(.horizontal)
                        }
                    } header: {
                        HStack {
                            Text("Hints")
                                .font(.custom("Lora-Regular_Medium", size: 17))
                            Spacer()
                            Button {
                                withAnimation {
                                    isShowingHints.toggle()
                                }
                            } label: {
                                Image(systemName: isShowingHints ? "chevron.up" : "chevron.down")
                                    .foregroundStyle(Color(.secondaryLabel))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .navigationTitle(assignment.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    
    
    AssignmentView()
}
