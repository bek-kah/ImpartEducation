import SwiftUI

struct UnitModuleView: View {
    
    let unitModule: UnitModule
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(unitModule.content, id: \.self) { text in
                        Text(text)
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                }
                .padding(.top)
            }
            .navigationTitle(unitModule.title)
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
        }
    }
}
    

#Preview {
    UnitModuleView(unitModule: courseInformation)
}


